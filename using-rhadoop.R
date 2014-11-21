library("rhdfs")
library("rmr2")
hdfs.init()

# quick hack to get access to hadoop.tmp.dir  (=/usr/local/hadoop/data )

# hadoop fs -chmod -R a+rwx /tmp

small.ints = to.dfs(1:10)

f <- function(k,v) {
  lapply(seq_along(v), function(r) { x <- runif(v[[r]]); keyval(r,c(max(x),min(x))) })
}

dfsfile <- mapreduce(input=small.ints, map=f

output <- from.dfs(dfsfile)

tbl <- do.call('rbind',lapply(output$val,"[[",2))

# maybe...
tbldf <- as.data.frame(tbl)
names(tbldf) <- c("maxval","minval")

#TODO continue here running wordcount on hadoop:

# define a function as a program:

wordcount = function (input, output = NULL, pattern = " ") {

  wc.map = function(., lines) {
    keyval(unlist(strsplit(x = lines,split = pattern)),1)
  }

  wc.reduce = function(word, counts ) { keyval(word, sum(counts)) }

  mapreduce(input = input, output = output, input.format = "text",
          map = wc.map, reduce = wc.reduce, combine = T)
}



