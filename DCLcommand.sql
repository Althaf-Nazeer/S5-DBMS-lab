ysql> select user();
+----------------+
| user()         |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.04 sec)

mysql> create database testdcl;
Query OK, 1 row affected (0.28 sec)

mysql> use testdcl;
Database changed
mysql> create table Emp(EMP_no int primary key, Emp_name varchar(10), Job
    -> varchar(10), Hiredata date, Salary float, Comm Float, Depno int );
Query OK, 0 rows affected (0.53 sec)

mysql> show tables;
+-------------------+
| Tables_in_testdcl |
+-------------------+
| Emp               |
+-------------------+
1 row in set (0.00 sec)

mysql> # create a new user
mysql> create user 'user_test@localhost' identified by "Test@123";
Query OK, 0 rows affected (0.19 sec)

mysql> # list users list and verify user_test exists.
mysql> select user from mysql.user;
+---------------------+
| user                |
+---------------------+
| user_test@localhost |
| debian-sys-maint    |
| mysql.infoschema    |
| mysql.session       |
| mysql.sys           |
| root                |
+---------------------+
6 rows in set (0.00 sec)

mysql> # check what all privileges allotted by default on creating new user.
mysql> show grants for 'user_test@localhost';
+-------------------------------------------------+
| Grants for user_test@localhost@%                |
+-------------------------------------------------+
| GRANT USAGE ON *.* TO `user_test@localhost`@`%` |
+-------------------------------------------------+
1 row in set (0.00 sec)

mysql> # grant all privileges to new user
mysql> grant select on *.* to 'user_test@localhost';
Query OK, 0 rows affected (0.07 sec)

mysql> # grant privileges to a specific table for (insert)
mysql> grant insert on testdcl.Emp to 'user_test@localhost';
Query OK, 0 rows affected (0.09 sec)

mysql> # grant update privilege to a specific attribute on a table
mysql> grant update (Emp_name) on testdcl.Emp to 'user_test@localhost';
Query OK, 0 rows affected (0.14 sec)

mysql> #show grants for new user
mysql> show grants for 'user_test@localhost';
+-----------------------------------------------------------------------------------+
| Grants for user_test@localhost@%                                                  |
+-----------------------------------------------------------------------------------+
| GRANT SELECT ON *.* TO `user_test@localhost`@`%`                                  |
| GRANT INSERT, UPDATE (`Emp_name`) ON `testdcl`.`Emp` TO `user_test@localhost`@`%` |
+-----------------------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> #Verify
mysql> # logoff mysql and login using below command, it will prompt for
mysql> password and enter the same password.
    -> ^C
mysql> mysql -u 'user_test@localhost' -p
    -> # verify user is user_test
    -> slect user();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql -u 'user_test@localhost' -p

slect user()' at line 1
mysql> # list the grants
mysql> show grants for 'user_test@localhost';
+-----------------------------------------------------------------------------------+
| Grants for user_test@localhost@%                                                  |
+-----------------------------------------------------------------------------------+
| GRANT SELECT ON *.* TO `user_test@localhost`@`%`                                  |
| GRANT INSERT, UPDATE (`Emp_name`) ON `testdcl`.`Emp` TO `user_test@localhost`@`%` |
+-----------------------------------------------------------------------------------+
2 rows in set (0.00 sec)

mysql> # select databse and list tables
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testdcl            |
+--------------------+
5 rows in set (0.00 sec)

mysql> use testdcl;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_testdcl |
+-------------------+
| Emp               |
+-------------------+
1 row in set (0.01 sec)

mysql> # insert into tables
mysql> INSERT INTO Emp VALUES(1,'Steven', 'Marketing', STR_TO_DATE('06-
    '> jan-1995', '%d-%M-%Y'),24000, NULL,2);
Query OK, 1 row affected (0.07 sec)

mysql> select * from Emp;
+--------+----------+-----------+------------+--------+------+-------+
| EMP_no | Emp_name | Job       | Hiredata   | Salary | Comm | Depno |
+--------+----------+-----------+------------+--------+------+-------+
|      1 | Steven   | Marketing | 1995-01-06 |  24000 | NULL |     2 |
+--------+----------+-----------+------------+--------+------+-------+
1 row in set (0.00 sec)

mysql> # logoff mysql and login to super user,
mysql> mysql -u root -p
    -> #change password of new user
    -> alter user 'user_test@localhost' identified by '123456#';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'mysql -u root -p

alter user 'user_test@localhost' identified by '123456#'' at line 1
mysql> # verify by logging with new password.
mysql> #logoff and login with user_test with newly modified password.
mysql> mysql -u 'user_test@localhost' -p
    -> ^DBye
asiet@asiet-ThinkCentre-E73:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.31-0ubuntu0.20.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> mysql -u 'user_test@localhost' -p
    -> ^DBye
asiet@asiet-ThinkCentre-E73:~$ mysql -u 'user_test@localhost' -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.0.31-0ubuntu0.20.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 
