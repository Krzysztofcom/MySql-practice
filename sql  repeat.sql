-- creating a new customer table with fictius data

create database if not exists clients_db;

create table clients_db.clients_tab (id tinyint(9) unsigned not null unique auto_increment primary key, pesel1 decimal(11) zerofill unsigned not null unique, c_forename varchar(20) not null, c_surname varchar(30) not null, city varchar(30) not null, country varchar(30) not null, date_of_b date not null, dofp date);

-- date_of_b = date of birth
-- dofp = date of obtaining the first product
insert into clients_tab(id, pesel1, c_forename, c_surname, city, country, date_of_b, dofp) values 
(default,'71121123341','James', 'Crump','New York', 'Usa','1971-12-11', '1995-07-31'), 
(default,'01121315414','Rick', 'Martens','Barcelona','Spain','2011-01-31', null),
(default,'02300567890', 'Anna', 'Norton', 'London', 'United Kingdom','2002-10-05',null),
(default,'09021332451','Monica','Norton','London','United Kingdom','1909-02-13','2010-05-27'),
(default,'10312981211','Andrei','Nowak', 'Moscow','Russia','2010-11-29','2020-01-03'),
(default,'10312981212','Vlad','Nowak', 'Petersburg','Russia','1910-11-29','2020-08-18'),
(default,'10411298121','Martin','Nowak', 'Paris','France','3010-11-29','2020-02-26'),
(default,'55060766664','Jurek','Kowalsky','Warsaw','Poland','1955-06-07','1991-03-14'),
(default,'61092066617','Joanna','Krupnik','Gdansk','Poland','1961-09-20','1995-09-16'),
(default,'77030189632','Monica','Inks','Krakow','Poland','1977-03-01','1993-07-04'),
(default,'72040945764','Wladyslaw','Brzeczyszczyk','Warsaw','Poland','1972-04-09','1997-11-22');

alter table clients_tab  add constraint check (length(pesel1)=11);
drop table clients_db.clients_tab;
select * from clients_db.clients_tab;


create table product_tab (p_id tinyint(9) unsigned not null unique auto_increment, p_name varchar(30), p_type varchar(30));
insert into product_tab (p_id, p_name, p_type) values
(default,'simple','acconuts'),
(default,'regular','acconuts'),
(default,'global','acconuts'),
(default,'prestige','acconuts'),
(default,'classic', 'credit card'),
(default,'silver', 'credit card'),
(default,'gold', 'credit card'),
(default, 'platinum', 'credit card'),
(default, 'payandforget', 'debit card'),
(default, 'debitregular', 'debit card'),
(default, 'debitworld', 'debit card'),
(default, 'vip', 'debit card'),
(default, 'saving_account_static','savings'),
(default, 'saving_account_dynamic','savings'),
(default, 'bank_deposit_static','savings'),
(default, 'bank_deposit_dynamic','savings'),
(default, 'bank_deposit_mix','savings'),
(default, 'bank_deposit_fc','savings'),
(default, 'regular_loan','loan'),
(default, 'promotional_loan','loan'),
(default, 'mortgage','loan');

drop table product_tab;
select * from product_tab where p_type='loan' or p_type='acconuts';

create table used_products_tab (up_id tinyint(9) unsigned not null unique auto_increment primary key, pp_id tinyint(9) not null, c_id tinyint(9) not null, open_date date not null, close_date date default null, account_number char(8) not null unique, balance decimal(12,2) default 0);
insert into used_products_tab (up_id, pp_id, c_id, open_date, close_date, account_number, balance ) values
(default,1,1,'1995-07-31','2000-02-28','11014327',default),
(default,2,4,'1988-04-04', default,'19012322',7873.37),
(default,5,5,'2020-01-03', default,'88143421',-2700.46),
(default,13,4,'2010-05-27', default,'15001781',111664.24),
(default,19,5,'2020-03-11', default,'02014324',-24357.73),
(default,3,6,'2020-08-18', default,'17114324',4055.89),
(default,6,7,'2020-02-26', default,'82014384',-5000.00),
(default,7,8,'1995-07-24', default,'32314324',-107.15),
(default,2,9,'1995-09-16', default,'02014554',2129.20),
(default,19,5,'2018-01-03', default,'02043262',-5357.99),
(default,4,10,'1993-07-04', default,'02013789',25033.18),
(default,1,11,'1997-11-22','2005-06-13','15600812',default),
(default,3,5,'2011-05-23', default,'52043262',6031),--
(default,9,5,'2011-05-23', default,'52010162',0),
(default,10,4,'1988-04-04', default,'19010132',0),
(default,11,6,'2020-08-19', default,'17010124',0),
(default,10,9,'1999-03-01', default,'02010154',0),
(default,12,10,'1993-08-06',default,'02010102',0),
(default,9,11,'1997-11-22','2005-06-13','15010112',default),
(default,20,1,'1991-02-01','2000-01-08','11030327',default);


drop table used_products_tab;
select * from used_products_tab;