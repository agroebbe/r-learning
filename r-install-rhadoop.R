# installing RHadopp

#first in ubuntu:
system("sudo apt-get install libcurl4-openssl-dev")

install.packages("RCurl")
install.packages( c('rJava','RJSONIO', 'itertools', 'digest','Rcpp','httr','functional','devtools', 'plyr','reshape2') )

# locate file in your distro: 
# hadoop-streaming*.jar
# use thing like 
setwd(Sys.getenv("HADOOP_HOME"))
system("find . -name 'hadoop-streaming*.jar' | grep hadoop-streaming")

Sys.setenv(HADOOP_STREAMING="/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.5.1.jar")


setwd("~/work")
# download from:
# https://github.com/RevolutionAnalytics/RHadoop/wiki/Downloads
install.packages("caTools")
install.packages("rmr2_3.2.0.tar.gz", repos=NULL, type="source")
Sys.setenv(HADOOP_CMD="/usr/local/hadoop/bin/hadoop")
install.packages("rhdfs_1.0.8.tar.gz", repos=NULL, type="source")
# need to install thrift for this:
install.packages("rhbase_1.2.1.tar.gz", repos=NULL, type="source")



