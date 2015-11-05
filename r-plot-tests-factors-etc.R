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



# Lattice Examples 
library(lattice) 
attach(mtcars)

# create factors with value labels 
gear.f<-factor(gear,levels=c(3,4,5),
               labels=c("3gears","4gears","5gears")) 
cyl.f <-factor(cyl,levels=c(4,6,8),
               labels=c("4cyl","6cyl","8cyl")) 

# kernel density plots by factor level (alternate layout) 
densityplot(~mpg|cyl.f, 
            main="Density Plot by Numer of Cylinders",
            xlab="Miles per Gallon", 
            layout=c(1,3))

# boxplots for each combination of two factors 
bwplot(cyl.f~mpg|gear.f,
       ylab="Cylinders", xlab="Miles per Gallon", 
       main="Mileage by Cylinders and Gears", 
       layout=c(1,3))
       
# scatterplots for each combination of two factors 
 xyplot(mpg~wt|cyl.f*gear.f, 
        main="Scatterplots by Cylinders and Gears", 
        ylab="Miles per Gallon", xlab="Car Weight")
       
 # 3d scatterplot by factor level 
 cloud(mpg~wt*qsec|cyl.f, 
       main="3D Scatterplot by Cylinders") 
       
     # dotplot for each combination of two factors 
     dotplot(cyl.f~mpg|gear.f, 
             main="Dotplot Plot by Number of Gears and Cylinders",
             xlab="Miles Per Gallon")
       
       # scatterplot matrix 
       splom(mtcars[c(1,3,4,5,6)], 
             main="MTCARS Data")