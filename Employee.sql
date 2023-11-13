mysql -u root -p 

SHOW DATABASES;
CREATE DATABASE db;

USE db;

CREATE TABLE employee( fname VARCHAR(25) NOT NULL,
    -> minit CHAR,
    -> lname VARCHAR(25) NOT NULL,
    -> ssn CHAR(9) NOT NULL,
    -> bdate DATE,
    -> address VARCHAR(30),
    -> sex CHAR,
    -> salary DECIMAL(10.2),
    -> super_ssn CHAR(9),
    -> dno INT NOT NULL,
    -> PRIMARY KEY (ssn),
    -> FOREIGN KEY (super_ssn)REFERENCES employee(ssn)
    -> );
 show tables;
 
 describe employee;
 
  CREATE TABLE department(
    -> dname VARCHAR(15) NOT NULL,
    -> dnumber INT NOT NULL,
    -> mgr_ssn CHAR(9) NOT NULL,
    -> mgr_start_date DATE,
    -> PRIMARY KEY (dnumber),
    -> UNIQUE (dname),
    -> FOREIGN KEY (mgr_ssn)REFERENCES employee(ssn)
    -> );

describe department;

ALTER TABLE employee ADD email VARCHAR(25);

describe employee;
ALTER TABLE employee MODIFY email VARCHAR(10) NOT NULL;
show columns from employee;

alter table department add deptlocation varchar(20);

alter table employee add foreign key(dno) references departmenttable(dnumber);

alter table departmenttable change deptlocation location varchar(20);

create table project(
    -> pname varchar(15) not null,
    -> pnumber int not null auto_increment,
    -> plocation varchar(15),
    -> dnum int not null,
    -> primary key(pnumber),
    -> unique(pname),
    -> foreign key(dnum) references departmenttable(dnumber)
    -> );

alter table departmenttable drop column location;

SET FOREIGN_KEY_CHECKS=0;

insert into departmenttable values('Research','1','ssn2001','2021-05-30');
insert into departmenttable values('Admin','2','ssn3001','2021-06-30');
 insert into departmenttable values('HQ','3','ssn4001','2021-07-30');

alter table employee drop column email;

insert into employee values ('John','B','Smith','ssn2001','1970-05-30','New York','M','100000','ssn1001',1);
mysql> insert into employee values ('Ramesh','A','Narayan','ssn3001','1971-05-30','New Delhi','M','100000','ssn
Query OK, 1 row affected (0.05 sec)

mysql> insert into employee values ('Sam','C','Eric','ssn4001','1972-05-30','Paris','M','100000','ssn4001',3);
Query OK, 1 row affected (0.04 sec)
mysql> insert into employee values ('James','D','Joe','ssn2002','1970-05-30','New York','M','50000','ssn2001',4);
Query OK, 1 row affected (0.03 sec)

mysql> insert into employee values ('Alice','E','Alice','ssn2003','1970-05-30','New York','M','100000','ssn1001
Query OK, 1 row affected (0.04 sec)

mysql> insert into employee values ('Bob','F','Bob','ssn2004','1970-05-30','New York','M','100000','ssn1001',1);
Query OK, 1 row affected (0.04 sec)

mysql> insert into employee values ('Ram','M','Ram','ssn2005','1970-05-30','New York','M','100000','ssn1001',1);
Query OK, 1 row affected (0.04 sec)

mysql> select * from employee;                                                                             +--------+-------+---------+---------+------------+-----------+------+--------+-----------+-----+
| fname  | minit | lname   | ssn     | bdate      | address   | sex  | salary | super_ssn | dno |
+--------+-------+---------+---------+------------+-----------+------+--------+-----------+-----+
| John   | B     | Smith   | ssn2001 | 1970-05-30 | New York  | M    | 100000 | ssn1001   |   1 |
| James  | D     | Joe     | ssn2002 | 1970-05-30 | New York  | M    |  50000 | ssn2001   |   4 |
| Alice  | E     | Alice   | ssn2003 | 1970-05-30 | New York  | M    | 100000 | ssn1001   |   5 |
| Bob    | F     | Bob     | ssn2004 | 1970-05-30 | New York  | M    | 100000 | ssn1001   |   1 |
| Ram    | M     | Ram     | ssn2005 | 1970-05-30 | New York  | M    | 100000 | ssn1001   |   1 |
| Ramesh | A     | Narayan | ssn3001 | 1971-05-30 | New Delhi | M    | 100000 | ssn3001   |   2 |
| Sam    | C     | Eric    | ssn4001 | 1972-05-30 | Paris     | M    | 100000 | ssn4001   |   3 |
+--------+-------+---------+---------+------------+-----------+------+--------+-----------+-----+

                                    insert into project values ('ProductX','1001','Cochin','1');
Query OK, 1 row affected (0.03 sec)

mysql> insert into project (pname, plocation, dnum) values ('Computerization','Cochin','1');
Query OK, 1 row affected (0.04 sec)

mysql> select * from project;
+-----------------+---------+-----------+------+
| pname           | pnumber | plocation | dnum |
+-----------------+---------+-----------+------+
| ProductX        |    1001 | Cochin    |    1 |
| Computerization |    1002 | Cochin    |    1 |
+-----------------+---------+-----------+------+
2 rows in set (0.00 sec)

mysql> insert into project (pname, plocation, dnum) values ('Jobfest','Cochin','3');
Query OK, 1 row affected (0.05 sec)

mysql> select dno, count(*), avg(salary), from employee group by dno;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from employee group by dno' at line 1
mysql> select dno, count(*), avg(salary) from employee group by dno;
+-----+----------+---------------+
| dno | count(*) | avg(salary)   |
+-----+----------+---------------+
|   1 |        5 |  90000.000000 |
|   2 |        1 | 100000.000000 |
|   3 |        1 | 100000.000000 |
+-----+----------+---------------+
3 rows in set (0.03 sec)

mysql> select fname , minit, lname, Address from employee where dno = (select dnnumber from departmenttable where dname='Research');
ERROR 1054 (42S22): Unknown column 'dnnumber' in 'field list'
mysql> select fname , minit, lname, Address from employee where dno = (select dnumber from departmenttable where dname='Research');
+-------+-------+-------+----------+
| fname | minit | lname | Address  |
+-------+-------+-------+----------+
| John  | B     | Smith | New York |
| James | D     | Joe   | New York |
| Alice | E     | Alice | New York |
| Bob   | F     | Bob   | New York |
| Ram   | M     | Ram   | New York |
+-------+-------+-------+----------+
