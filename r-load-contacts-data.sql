-- run using : mysql --local-infile -u rmysql -p < r-load-contacts-data.sql

-- NOTE: --local-infile is needed as option for "load data local" to work !!!


use rdata;

-- generated using python csvkit: csvsql command
-- then adapated varchar size manually

drop table if exists contacts;

CREATE TABLE if not exists contacts (
	counter INTEGER NOT NULL, 
	name VARCHAR(255) NOT NULL, 
	first_name VARCHAR(255), 
	last_name VARCHAR(255), 
	email VARCHAR(255) NOT NULL, 
	title VARCHAR(255), 
	grade VARCHAR(10), 
	bureau VARCHAR(255), 
	building VARCHAR(255), 
	bus_tel VARCHAR(40), 
	mob_tel VARCHAR(40), 
	company VARCHAR(255), 
	division VARCHAR(40), 
	departement VARCHAR(40), 
	domain VARCHAR(40), 
	team VARCHAR(20), 
	x400 VARCHAR(255), 
	perid VARCHAR(20), 
	language VARCHAR(255), 
	manager VARCHAR(255), 
	manager_perid VARCHAR(4000), 
	distribution_lists VARCHAR(4000)
);

load data local infile '~/host/data/contact-csv-2014-10-20.csv' 
 replace into table rdata.contacts 
 fields terminated by ';' 
 ignore 1 lines;

-- counter;name;first_name;last_name;email;title;grade;bureau;building;bus_tel;mob_tel;company;division;departement;domain;team;x400;perid;language;manager;manager_perid;distribution_lists
-- 2;[COP - SIO] Synergy;;;id813842m00@belgacom.be;;;;;;;;;;;;/o=BelgacomGroup/ou=Exchange Administrative Group (FYDIBOHF23SPDLT)/cn=Recipients/cn=id813842m00aef;id813842m00;;LAMRABTI Ahmed (CUO/CFF);id813842;[]
