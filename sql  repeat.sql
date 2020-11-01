-- creating a new customer table with fictius data

create database if not exists clients_db;
create table clients_db.clients_tab (c_id tinyint(9) unsigned not null unique auto_increment, pesel1 decimal(11) zerofill unsigned not null unique, c_forename varchar(20) not null, c_surname varchar(30) not null, city varchar(30) not null, country varchar(30) not null, date_of_b date not null, dofp date);
-- date_of_b = date of birth
-- dofp = date of obtaining the first product
insert into clients_db.clients_tab values 
(default,71121123341,'James', 'Crump','New York', 'Usa','1971-12-11', '1995-07-31'), 
(default,1121315414,'Rick', 'Martens','Barcelona','Spain','2011-01-31', null),
(default,02300567890, 'Anna', 'Norton', 'London', 'United Kingdom','2002-10-05',null),
(default,09021332451,'Monica','Norton','London','United Kingdom','1909-02-13','2010-05-27'),
(default,10312981211,'Andrei','Nowak', 'Moscow','Russia','2010-11-29','2020-01-03');

 select * from clients_db.clients_tab;
select pesel1, length(pesel1) from clients_db.clients_tab;
select pesel1, length(pesel1) as cos, char_length(pesel1) as znaki, character_length(pesel1) as znaki1 from clients_b;
select pesel1, char_length(pesel1) as znaki from clients_b;

drop table clients_db.clients_b;
-- alter table clients_b add check (length(pesel1)=11);

drop function if exists pesel1_veryfication;
DELIMITER $$
CREATE DEFINER=current_user FUNCTION pesel1_veryfication(A_var decimal(11), B_var date) 
	returns tinyint(1) 
	LANGUAGE SQL
	DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN 
  DECLARE C_var tinyint(1);
  -- A_var = pesel1 example 80012981211,  B_var = date of birth 1980-01-29
  if (substring(A_var,1,2)=substring(B_var3,2) and substring(A_var,3,2)=substring(B_var,6,2) and (substring(A_var,5,2)=substring(B_var,9,2))) then set C_var=1;
 elseif (substring(A_var,1,2)=substring(B_var3,2) and substring(A_var,3,2)=(substring(B_var,6,2)+substring(B_var,1,2)) and (substring(A_var,5,2)=substring(B_var,9,2))) then set C_var=1;
  else set C_var=0;
end if;
  RETURN C_var;
END$$
DELIMITER ;
select pesel1,date_of_b,pesel1_veryfication(clients_tab.pesel1,clients_tab.date_of_b) from clients_tab;



