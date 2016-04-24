miui:~ $ sudo service mysql stop 
                                              
miui:~ $ sudo mysqld_safe --skip-grant-table

miui:~ $ mysql -uroot mysql

mysql> show databases;

mysql> use mysql;

mysql> show tables;

mysql> update user set Password=PASSWORD('password') where USER='root';         

mysql> flush privileges;                                                                                                                               
miui:~ $ sudo service mysql start


