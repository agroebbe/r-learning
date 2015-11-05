setwd("~/work/r")
d = read.table(file="tst1.txt", sep=" ", header=TRUE)
d
d$g = d$g * 5
d
write.table(d, file="tst2.txt", sep=" ",row.names=FALSE)
d = read.table(file="tst2.txt", sep=" ", header=TRUE)
d





