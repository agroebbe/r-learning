setwd("~/work/r")
mydata <- read.table(file="mydata.txt",header=T)
mdata <- melt(mydata,id=c("id","time"))
mdata

