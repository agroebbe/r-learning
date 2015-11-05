# A Silly Axis Example

# specify the data 
x <- c(1:10); y <- x; z <- 10/x

# create extra margin room on the right for an axis 
par(mar=c(5, 4, 4, 8) + 0.1)

# plot x vs. y 
plot(x, y,type="b", pch=21, col="red", 
     yaxt="n", lty=3, xlab="", ylab="")

# add x vs. 1/x 
lines(x, z, type="b", pch=22, col="blue", lty=2)

# draw an axis on the left 
perpendicular = 2
parallel = 0
axis(2, at=x,labels=x, col.axis="blue", las=perpendicular)

# draw an axis on the right, with smaller text and ticks 
axis(4, at=z,labels=round(z,digits=2),
     col.axis="blue", las=2, cex.axis=1.7, tck=-.03)


# add a title for the right axis 
mtext("y=1/x", side=4, line=3, cex.lab=1,las=2, col="blue")

# add a main title and bottom and left axis labels 
title("An Example of Creative Axes", xlab="X values",
      ylab="Y=X")


z <- rbind(log2(1:10), sqrt(1:10), (1:10)/3) # data matrix 
barX <- barplot(z, beside=TRUE) 
text(cex=.5, x=barX, y=z+par("cxy")[2]/2, round(z,2), xpd=TRUE) 