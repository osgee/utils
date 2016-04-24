miui:~ $ sudo service mysql stop 
                                              
miui:~ $ sudo mysqld_safe --skip-grant-table

miui:~ $ mysql -uroot mysql

mysql> 

	show databases;
	use mysql;
	show tables;
	update user set Password=PASSWORD('password') where USER='root';         
	flush privileges;                                                                                                                               
miui:~ $ sudo service mysql start


