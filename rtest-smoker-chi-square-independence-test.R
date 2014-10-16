setwd("~/work/r")
# INFO: see http://www.cyclismo.org/tutorial/R/tables.html
smokerData <- read.csv(file='smoker.csv',sep=',',header=T)
summary(smokerData)
smoke <- table(smokerData) # first and second column determine labels
smoke
barplot(smoke,legend=T,beside=T,main='Smoking Status by SES')
plot(smoke)
margin.table(smoke,2)
prop.table(smoke) # proportions
prop.table(smoke,1) # proportions, given row name as being occured
prop.table(smoke,2) # proportions, given col name as being occured
summary(smoke)
as.array(smoke)
# calculations: (t = transpose %*% = mat mult)
expected <- as.array(margin.table(smoke,1)) %*% t(as.array(margin.table(smoke,2))) / margin.table(smoke)
chi <- sum((expected - as.array(smoke))^2/expected)
1-pchisq(chi,df=4)

