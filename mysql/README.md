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
        
        
### Basic

#### Create Database

        CREATE DATABASE `db_name`;
        USE db_name;


#### Create/Drop Table

        CREATE TABLE `tb_name`
        (
        id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
        name VARCHAR(25) NOT NULL,
        deptId INT(11) DEFAULT 1111,
        salary FLOAT
        )DEFAULT CHARSET=`utf8` AUTO_INCREMENT=1;
        
        DROP TABLE IF EXISTS tb_dept;
           
           
#### Field/FK

        ALTER TABLE tb_dept ADD column1 VARCHAR(11) NOT NULL;
        ALTER TABLE tb_dept ADD column2 INT(11) FIRST;
        ALTER TABLE tb_dept ADD column3 AFTER name;
        ALTER TABLE tb_Dept MODIFY column1 VARCHAR(12) AFTER location;
        UPDATE article a SET a.journalid=10 WHERE a.journalid=20;
        DELETE from journal WHERE journalid=20;
        
        ALTER TABLE `article` 
        ADD CONSTRAINT `c_article_journal_FK` 
        FOREIGN KEY (`journalid`)  
        REFERENCES `journal` (`journalid`);
        
        UPDATE article SET article.journalid =3 
        WHERE article.journalid IN
        (
        SELECT journalid 
        FROM 
        (
        SELECT journal.journalid, journal 
        FROM article LEFT JOIN journal 
        ON article.journalid=journal.journalid
        ) AS c 
        GROUP BY journalid
        HAVING COUNT(*)<20
        );
        
        SELECT COUNT(*), journal, journalid 
        FROM
        (
        SELECT journal.journalid, journal 
        FROM article LEFT JOIN journal 
        ON article.journalid=journal.journalid
        ) AS c 
        GROUP BY journalid 
        ORDER BY COUNT(*) ASC;
        
        
#### View

        CREATE VIEW view_name AS SELECT ...;
        UPDATE view_name SET ...;
        
        
#### Trigger

        CREATE TRIGGER trigger_name trigger_time trigger_event ON tb_name FOR EACH ROW trigger_stmt;
        CREATE TRIGGER ins_sum 
        BEFORE INSERT ON account 
        FOR EACH ROW 
        SET @sum=@sum+NEW.amount;
        
        
#### Insert

        INSERT INTO tb_name(...) values(...),(...),...;
        
        
#### User 

        CREATE USER 'jeffery'@'localhost' IDENTIFIED BY 'mypass';
        GRANT privileges ON db.table TO user@host [IDENTIFIED BY 'password'] [WITH GRANT OPTION];
        DROP USER 'user'@'localhost';
        SET PASSWORD FOR 'user'@'host' = PASSWORD('otherpassword');
        SET PASSWORD = PASSWORD('otherpassword'); -- FOR ROOT
        REVOKE privileges ON db.table FROM 'user'@'host';
        

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

restart mysql

        sudo service mysql start
        


