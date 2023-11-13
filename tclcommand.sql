
mysql> set autocommit=0
    -> ;
Query OK, 0 rows affected (0.00 sec)

mysql> Experiment 1. Commit
    -> SET autocommit=0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Experiment 1. Commit
SET autocommit=0' at line 1
mysql> create table Emp(EMP_no int primary key, Emp_name varchar(10), Job
    -> varchar(10), Hiredata date, Salary float, Comm Float, Depno int 
    -> references Dept(department_id));
ERROR 1046 (3D000): No database selected
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
5 rows in set (0.01 sec)

mysql> create database db;
Query OK, 1 row affected (0.17 sec)

mysql> use db;
Database changed
mysql> Experiment 1. Commit
    -> SET autocommit=0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Experiment 1. Commit
SET autocommit=0' at line 1
mysql> create table Emp(EMP_no int primary key, Emp_name varchar(10), Job
    -> varchar(10), Hiredata date, Salary float, Comm Float, Depno int 
    -> references Dept(department_id));
Query OK, 0 rows affected (0.48 sec)

mysql> INSERT INTO Emp VALUES(1,'Steven', 'Marketing', STR_TO_DATE('06-
    '> jan-1995', '%d-%M-%Y'),24000, NULL,2);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Emp VALUES(2,'Neena', 'FI_ACCOUNT',
    -> STR_TO_DATE('06-feb-1987', '%d-%M-%Y'),34000, NULL,1);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Emp VALUES(3,'Lex', 'FI_MGR', STR_TO_DATE('06-jan-
    '> 1980', '%d-%M-%Y'),240000, NULL,1);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Emp VALUES(4,'Alexander', 'Sa_Rep', STR_TO_DATE('06-
    '> jun-1987', '%d-%M-%Y'),20000, NULL,4);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Emp VALUES(5,'Bruce', 'IT_PROG',STR_TO_DATE('06-
    '> jul-1990', '%d-%M-%Y'),24000, NULL,4);
Query OK, 1 row affected (0.00 sec)

mysql> start transaction ;
Query OK, 0 rows affected (0.11 sec)

mysql> INSERT INTO Emp VALUES(6,'Jack','Clerk', STR_TO_DATE('06-aug-
    '> 1980', '%d-%M-%Y'),240000, NULL,5);
Query OK, 1 row affected (0.00 sec)

mysql> UPDATE Emp SET Job = 'FI_MGR' where EMP_no = 6;
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> commit;
Query OK, 0 rows affected (0.09 sec)

mysql> select * from Emp;
+--------+-----------+------------+------------+--------+------+-------+
| EMP_no | Emp_name  | Job        | Hiredata   | Salary | Comm | Depno |
+--------+-----------+------------+------------+--------+------+-------+
|      1 | Steven    | Marketing  | 1995-01-06 |  24000 | NULL |     2 |
|      2 | Neena     | FI_ACCOUNT | 1987-02-06 |  34000 | NULL |     1 |
|      3 | Lex       | FI_MGR     | 1980-01-06 | 240000 | NULL |     1 |
|      4 | Alexander | Sa_Rep     | 1987-06-06 |  20000 | NULL |     4 |
|      5 | Bruce     | IT_PROG    | 1990-07-06 |  24000 | NULL |     4 |
|      6 | Jack      | FI_MGR     | 1980-08-06 | 240000 | NULL |     5 |
+--------+-----------+------------+------------+--------+------+-------+
6 rows in set (0.00 sec)

mysql> SET autocommit=0;
Query OK, 0 rows affected (0.00 sec)

mysql> start transaction;
Query OK, 0 rows affected (0.00 sec)

mysql> update Emp set Salary = Salary + 1000 where EMP_no = 6;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> # create savepoint
mysql> SAVEPOINT emp_save_point1;
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO Emp VALUES(7,'Girish','Clerk', STR_TO_DATE('06-aug- 
    '> 1980', '%d-%M-%Y'),240000, NULL,5);
Query OK, 1 row affected (0.00 sec)

mysql> # verify Girish is added ;
mysql> select * from Emp;
+--------+-----------+------------+------------+--------+------+-------+
| EMP_no | Emp_name  | Job        | Hiredata   | Salary | Comm | Depno |
+--------+-----------+------------+------------+--------+------+-------+
|      1 | Steven    | Marketing  | 1995-01-06 |  24000 | NULL |     2 |
|      2 | Neena     | FI_ACCOUNT | 1987-02-06 |  34000 | NULL |     1 |
|      3 | Lex       | FI_MGR     | 1980-01-06 | 240000 | NULL |     1 |
|      4 | Alexander | Sa_Rep     | 1987-06-06 |  20000 | NULL |     4 |
|      5 | Bruce     | IT_PROG    | 1990-07-06 |  24000 | NULL |     4 |
|      6 | Jack      | FI_MGR     | 1980-08-06 | 241000 | NULL |     5 |
|      7 | Girish    | Clerk      | 1980-08-06 | 240000 | NULL |     5 |
+--------+-----------+------------+------------+--------+------+-------+
7 rows in set (0.00 sec)

mysql> # rollback
mysql> ROLLBACK TO SAVEPOINT emp_save_point1;
Query OK, 0 rows affected (0.00 sec)

mysql> #commit transaction
mysql> commit;
Query OK, 0 rows affected (0.09 sec)

mysql> # verify Girish is removed on rollback;
mysql> select * from Emp;
+--------+-----------+------------+------------+--------+------+-------+
| EMP_no | Emp_name  | Job        | Hiredata   | Salary | Comm | Depno |
+--------+-----------+------------+------------+--------+------+-------+
|      1 | Steven    | Marketing  | 1995-01-06 |  24000 | NULL |     2 |
|      2 | Neena     | FI_ACCOUNT | 1987-02-06 |  34000 | NULL |     1 |
|      3 | Lex       | FI_MGR     | 1980-01-06 | 240000 | NULL |     1 |
|      4 | Alexander | Sa_Rep     | 1987-06-06 |  20000 | NULL |     4 |
|      5 | Bruce     | IT_PROG    | 1990-07-06 |  24000 | NULL |     4 |
|      6 | Jack      | FI_MGR     | 1980-08-06 | 241000 | NULL |     5 |
+--------+-----------+------------+------------+--------+------+-------+
6 rows in set (0.00 sec)
