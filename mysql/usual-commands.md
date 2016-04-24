miui:~ $ mysql -uroot -p

mysql>
show databases;
create database db;
drop database db;

use db;
show tables;
describe tb;
select * from tb;
insert into tb(`a`,`b`) values("a","b");
update tb set f="f" where 1=1;
delete from tb where 1=1;

miui:~ mysqldump -uroot -p db tb > db.sql

