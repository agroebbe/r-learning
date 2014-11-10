setwd("~/host/data")
contacts <- read.csv(file='contact-csv-2014-10-20.csv',sep=';',header=T)
#TODO cleaning
# perid max length
# ...

#info: unique(contacts$language)

#filter rows on normal per id:
contacts <- contacts[which(grepl("id\\d{6}$",contacts$perid)),]
contacts$externalone <- grepl("\\.ext",contacts$email)

#?interaction.plot

simplegrade <- contacts$grade
levels(simplegrade) <- c(levels(simplegrade),"OTHER")
simplegrade[!(simplegrade %in% c("1A","1B"))] <- "OTHER"
simplegrade <- factor(simplegrade)
levels(simplegrade)

freqt <- table(contacts$division)
freqt <- freqt[freqt>30]
simplediv <- contacts$division
levels(simplediv) <- c(levels(simplediv),"OTHERDIV")
simplediv[!(simplediv %in% names(freqt))] <- "OTHERDIV"
simplediv <- factor(simplediv)

#View(table(simplediv))

interaction.plot(simplediv, simplegrade, contacts$externalone, fun = sum)


library(lattice)
x <- seq(pi/4, 5 * pi, length.out = 100)
y <- seq(pi/4, 5 * pi, length.out = 100)
r <- as.vector(sqrt(outer(x^2, y^2, "+")))
grid <- expand.grid(x=x, y=y)
grid$z <- cos(r^2) * exp(-r/(pi^3))
levelplot(z~x*y, grid, cuts = 50, scales=list(log="e"), xlab="",
          ylab="", main="Weird Function", sub="with log scales",
          colorkey = FALSE, region = TRUE)
