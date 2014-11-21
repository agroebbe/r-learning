#check libjvm.so can be found for java: 
Sys.getenv("LD_LIBRARY_PATH")
correctJavaLD <- "/usr/lib/jvm/java-7-oracle/jre/lib/amd64/server"
Sys.setenv(LD_LIBRARY_PATH = paste(Sys.getenv("LD_LIBRARY_PATH"),":",correctJavaLD,sep="") )
Sys.getenv("LD_LIBRARY_PATH")

# OR NEED TO START RSTUDIO FROM BASH WITH CORRECT VARIABLES SET...

Sys.setenv(HADOOP_CONF_DIR="/usr/local/hadoop/share/hadoop")

library(Rhipe)

# setup before vuser (this R user) on HDFS
# hadoop fs -mkdir -p /user/vuser
# hadoop fs -chown -R vuser:vuser /user/vuser/

rhinit()

#ISSUE PATH CLASSPATH
.jclassPath()


#error due to hadoop 2.2 uses protobuf 2.5 and RHIPE used protobuf 2.4.1
# see http://nguyenvulong.com/hadoop-2-2-and-flume-1-4-protobuf/

#see https://groups.google.com/forum/#!topic/rhipe/E8fAuZaEeKA
