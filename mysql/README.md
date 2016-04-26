# mysql

### Common Commands

login in shell

        mysql -uroot -p

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

data dump

        mysqldump -uroot -p db tb > db.sql

### Issues

#### Reset Root Password

        sudo service mysql stop                                         
        sudo mysqld_safe --skip-grant-table
        mysql -uroot mysql

mysql> 

        show databases;
        use mysql;
        show tables;
        update user set Password=PASSWORD('password') where USER='root';         
        flush privileges;
        \q;
                                                                                                                                     
        sudo service mysql start

