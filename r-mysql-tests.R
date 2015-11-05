setwd("~/work/r")

library(RMySQL)

mydb <- dbConnect(MySQL(), user='rmysql', password='rmysql', dbname='rdata', host='localhost')

dbListTables(mydb)
dbListFields(mydb, 'contacts')

rs <- dbSendQuery(mydb, "select * from contacts")
dataset = fetch(rs, n=-1)
