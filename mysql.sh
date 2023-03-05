# install mysql on MacOS
brew install mysql

# start mysql server (Daemon)
brew services start mysql

# it was installed without a root password, so if you wanna run it securely
mysql_secure_installation

# to satisfy the current password policy requirements
# you should set your password according to the following conditions
## least at 8 characters
## include upper/lowercase letters, numbers, special characters

# login
mysql -u root -p

Welcome to the MySQL monitor.  Commands end with ; or \g.
Server version: 8.0.32 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

# list up your databases
show databases;

# create a database
create database [DATABASE_NAME];

# use database
use [DATABASE_NAME]

# list up tables in database
show tables;

# create a table
create table [TABLE_NAME] (
  -> id INT NOT NULL AUTO_INCREMENT,
  -> name VARCHAR(20),
  -> phone VARCHAR(20),
  -> PRIMARY KEY(id)
  -> );

# insert item
insert into [TABLE_NAME](name, phone) values("HANNY", "010");
insert into [TABLE_NAME](name, phone) values("HAERIN", "011");
insert into [TABLE_NAME](name, phone) values("HYEIN", "012");
insert into [TABLE_NAME](name, phone) values("DANIEL", "013");
insert into [TABLE_NAME](name, phone) values("MINJI", "014");

# select items from table
select * from [TABLE_NAME];
select name from [TABLE_NAME];
select phone from [TABLE_NAME] where name='HANNY';

# update table
update [TABLE_NAME] set phone='015' where name='MINJI';
update [TABLE_NAME] set phone='016' where phone='013';

# sort
select * from [TABLE_NAME] order by id DESC;

# delete item
delete from [TABLE_NAME] where name='NAME2';

# delete table
drop table [TABLE_NAME];

# stop mysql server (Daemon)
brew services stop mysql
