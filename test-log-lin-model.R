#log lin analysis --> for analysing discrete variables (like regression for numericals)
## http://ww2.coastal.edu/kingw/statistics/R-tutorials/loglin.html
library("MASS")
data(Titanic)
mdl = loglm( ~ Class * Sex * Age * Survived, data=Titanic)
step(mdl, direction="backward")