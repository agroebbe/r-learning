#write.table(file="tbltest.txt",aggregate(mtcars, by=list("per_gear"=gear,"per_carb"=carb), FUN=sum),row.names = FALSE)
#file.show(file="tbltest.txt")


#TODO make it work:
plot(data = data.frame(mtcars$disp, mtcars$hp, calc=20.99+1.43*mtcars$hp),type="l")


# library(ggplot2)
# library(reshape)
# data <- data.frame(mtcars$disp, mtcars$hp, calc=20.99+1.43*mtcars$hp)
# #data_molten <- melt(data, id.vars = "time")
# data_molten <- data
# ggplot(data_molten, aes(x = mtcars$disp, y = value, colour = variable)) + geom_line()