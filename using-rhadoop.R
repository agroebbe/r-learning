# note the Sys.env needs to be set !!
system("R CMD javareconf -e # exports JAVA variables")
Sys.getenv()[grep("hadoop",Sys.getenv())]
Sys.getenv()[grep("java",Sys.getenv())]

library("rhdfs")
library("rmr2")
hdfs.init()

# quick hack to get access to hadoop.tmp.dir  (=/usr/local/hadoop/data )
# hadoop fs -chmod -R a+rwx /tmp
# note: make a user directory in hadoop using 'hadoop fs ... command'


small.ints = to.dfs(1:10)

f <- function(k,v) {
  lapply(seq_along(v), function(r) { x <- runif(v[[r]]); keyval(r,c(max(x),min(x))) })
}

dfsfile <- mapreduce(input=small.ints, map=f)

output <- from.dfs(dfsfile)

tbl <- do.call('rbind',lapply(output$val,"[[",2))

# maybe...
tbldf <- as.data.frame(tbl)
names(tbldf) <- c("maxval","minval")

str(tbldf)
#TODO continue here running wordcount on hadoop:

# see also:
#   RMR2 example: https://github.com/RevolutionAnalytics/rmr2/blob/master/pkg/tests/wordcount.R

# define a function as a program:

wordcount = function (input, output = NULL, pattern = " ") {

  wc.map = function(., lines) {
    keyval(unlist(strsplit(x = lines,split = pattern)),1)
  }

  wc.reduce = function(word, counts) { keyval(word, sum(counts)) }

  mapreduce(input = input, output = output, input.format = "text",
          map = wc.map, reduce = wc.reduce, combine = T)
}

file.path(list.files("/usr/local/hadoop","*.txt"))
hdfs.ls("/user/vuser/txts")
hdfs.cat("/user/vuser/txts")
hdfs.rm("/user/vuser/txts")

fromfile <- file.path("/usr/local/hadoop/README.txt")
hdfs.put(fromfile,file.path("/user/vuser/txts",basename(fromfile)))

#multiple file transfer:
?list.files
fromfiles <- file.path(list.files("/usr/local/hadoop","*.txt", full.names = T))
str(fromfiles)
sapply(fromfiles, function(ff){ hdfs.put(ff,file.path("/user/vuser/txts",basename(ff))) })

# NOTE: when hadoop streaming failed with error code 5  --> file not found or permission problem
hdfile <- "/user/vuser/txts/README.txt"
hdfs.ls(hdfile)
wordcount(hdfile)

wordcount(to.dfs(keyval(NULL, "dit is een tekst")))

