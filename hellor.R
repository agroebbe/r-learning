setwd("~/work/r")

processV = function(v) {
  for(i in 1:length(v)) {
    if (i<5) {
      v[i] = 10*v[i]
    } else if (i > 90) {
      v[i] = 0.1*v[i]    
    }
  }
  return(v)
}

mycat = function(pre,txt,post) {
  cat(pre,txt,post)
  return(1)
}

(fit <- arima(log10(AirPassengers), c(0, 1, 1),
              seasonal = list(order = c(0, 1, 1), period = 12)))
update(fit, method = "CSS")
update(fit, x = window(log10(AirPassengers), start = 1954))
pred <- predict(fit, n.ahead = 24)
tl <- pred$pred - 1.96 * pred$se
tu <- pred$pred + 1.96 * pred$se
ts.plot(AirPassengers, 10^tl, 10^tu, log = "y", lty = c(1, 2, 2))