mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 6
Server version: 5.7.40-0ubuntu0.18.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database stud;
Query OK, 1 row affected (0.00 sec)

mysql> use stud;
Database changed
mysql> create table student(
    -> rollno int primary key auto_increment,
    -> name varchar(25) not null,
    -> email varchar(25),
    -> phonenum int);
Query OK, 0 rows affected (0.24 sec)

mysql> describe student;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| rollno   | int(11)     | NO   | PRI | NULL    | auto_increment |
| name     | varchar(25) | NO   |     | NULL    |                |
| email    | varchar(25) | YES  |     | NULL    |                |
| phonenum | int(11)     | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> create table subject(
    -> subjectid int primary key,
    -> subjectname varchar(25) not null);
Query OK, 0 rows affected (0.24 sec)

mysql> describe student;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| rollno   | int(11)     | NO   | PRI | NULL    | auto_increment |
| name     | varchar(25) | NO   |     | NULL    |                |
| email    | varchar(25) | YES  |     | NULL    |                |
| phonenum | int(11)     | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> describe subject;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| subjectid   | int(11)     | NO   | PRI | NULL    |       |
| subjectname | varchar(25) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> create table mark(
    -> sid int,
    -> rno int
    -> ,
    -> totalmarks int,
    -> primary key(sid,rno));
Query OK, 0 rows affected (0.24 sec)

mysql> describe marks;
ERROR 1146 (42S02): Table 'stud.marks' doesn't exist
mysql> describe mark;
+------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| sid        | int(11) | NO   | PRI | NULL    |       |
| rno        | int(11) | NO   | PRI | NULL    |       |
| totalmarks | int(11) | YES  |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> 
mysql> alter table mark add foreign key(rno) references student(rollno);
Query OK, 0 rows affected (0.63 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table mark add foreign key(sid) references subject(subjectid);
Query OK, 0 rows affected (0.59 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe mark;                                                 +------------+---------+------+-----+---------+-------+
| Field      | Type    | Null | Key | Default | Extra |
+------------+---------+------+-----+---------+-------+
| sid        | int(11) | NO   | PRI | NULL    |       |
| rno        | int(11) | NO   | PRI | NULL    |       |
| totalmarks | int(11) | YES  |     | NULL    |       |
+------------+---------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> describe student;                                              +----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| rollno   | int(11)     | NO   | PRI | NULL    | auto_increment |
| name     | varchar(25) | NO   |     | NULL    |                |
| email    | varchar(25) | YES  |     | NULL    |                |
| phonenum | int(11)     | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql> alter table student add address varchar(25);
Query OK, 0 rows affected (0.41 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe student;
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| rollno   | int(11)     | NO   | PRI | NULL    | auto_increment |
| name     | varchar(25) | NO   |     | NULL    |                |
| email    | varchar(25) | YES  |     | NULL    |                |
| phonenum | int(11)     | YES  |     | NULL    |                |
| address  | varchar(25) | YES  |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> alter table mark modify totalmarks decimal(10,4);
Query OK, 0 rows affected (0.61 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc mark;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| sid        | int(11)       | NO   | PRI | NULL    |       |
| rno        | int(11)       | NO   | PRI | NULL    |       |
| totalmarks | decimal(10,4) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> describe mark;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| sid        | int(11)       | NO   | PRI | NULL    |       |
| rno        | int(11)       | NO   | PRI | NULL    |       |
| totalmarks | decimal(10,4) | YES  |     | NULL    |       |
+------------+---------------+------+-----+---------+-------+
3 rows in set (0.00 sec)
