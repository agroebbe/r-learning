# first:  sudo apt-get install libmysqlclient-dev
# then find files of this package: 
# dpkg -L libmysqlclient-dev

Sys.setenv(PKG_CPPFLAGS = "-I/usr/include/mysql")
Sys.setenv(PKG_LIBS = "-L/usr/lib/mysql -lmysqlclient")
install.packages("RMySQL")
