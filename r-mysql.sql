-- run as mysql -u root -p < r-mysql.sql
grant usage on *.* TO 'rmysql'@'localhost';
drop user 'rmysql'@'localhost';
drop database if exists rdata;
create database if not exists rdata;
create user 'rmysql'@'localhost' identified by 'rmysql';
grant all on rdata.* to 'rmysql'@'localhost';


