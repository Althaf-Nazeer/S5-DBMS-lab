mysql> use db;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> # create table Emp
mysql> create table Emp(EMP_no int primary key, Emp_name varchar(10), Job
    -> varchar(10), Hiredata date, Salary float, Comm Float, Depno int);
ERROR 1050 (42S01): Table 'Emp' already exists
mysql> # insert data
mysql> INSERT INTO Emp VALUES(1,'Steven', 'Marketing', STR_TO_DATE('06-jan-
    '> 1995', '%d-%M-%Y'),24000, NULL,2);
ERROR 1062 (23000): Duplicate entry '1' for key 'Emp.PRIMARY'
mysql> INSERT INTO Emp VALUES(2,'Neena', 'FI_ACCOUNT', STR_TO_DATE('06-
    '> feb-1987', '%d-%M-%Y'),34000, NULL,1);
ERROR 1062 (23000): Duplicate entry '2' for key 'Emp.PRIMARY'
mysql> INSERT INTO Emp VALUES(3,'Lex', 'FI_MGR', STR_TO_DATE('06-jan-1980',
    -> '%d-%M-%Y'),240000, NULL,1);
ERROR 1062 (23000): Duplicate entry '3' for key 'Emp.PRIMARY'
mysql> INSERT INTO Emp VALUES(4,'Alexander', 'Sa_Rep', STR_TO_DATE('06-jun-
    '> 1987', '%d-%M-%Y'),20000, NULL,4);
ERROR 1062 (23000): Duplicate entry '4' for key 'Emp.PRIMARY'
mysql> INSERT INTO Emp VALUES(5,'Bruce', 'IT_PROG',STR_TO_DATE('06-jul-
    '> 1990', '%d-%M-%Y'),24000, NULL,4);
ERROR 1062 (23000): Duplicate entry '5' for key 'Emp.PRIMARY'
mysql> # create view
mysql> create view emp_view as select EMP_no, Emp_name, Salary from Emp where
    -> Salary>20000;
Query OK, 0 rows affected (0.11 sec)

mysql> select * from emp_view ;
+--------+----------+--------+
| EMP_no | Emp_name | Salary |
+--------+----------+--------+
|      1 | Steven   |  24000 |
|      2 | Neena    |  34000 |
|      3 | Lex      | 240000 |
|      5 | Bruce    |  24000 |
|      6 | Jack     | 241000 |
+--------+----------+--------+
5 rows in set (0.00 sec)

mysql> # update salary in view
mysql> update emp_view set Salary = 999;
Query OK, 5 rows affected (0.06 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> # verify, the Emp table is updated
mysql> select * from Emp;
+--------+-----------+------------+------------+--------+------+-------+
| EMP_no | Emp_name  | Job        | Hiredata   | Salary | Comm | Depno |
+--------+-----------+------------+------------+--------+------+-------+
|      1 | Steven    | Marketing  | 1995-01-06 |    999 | NULL |     2 |
|      2 | Neena     | FI_ACCOUNT | 1987-02-06 |    999 | NULL |     1 |
|      3 | Lex       | FI_MGR     | 1980-01-06 |    999 | NULL |     1 |
|      4 | Alexander | Sa_Rep     | 1987-06-06 |  20000 | NULL |     4 |
|      5 | Bruce     | IT_PROG    | 1990-07-06 |    999 | NULL |     4 |
|      6 | Jack      | FI_MGR     | 1980-08-06 |    999 | NULL |     5 |
+--------+-----------+------------+------------+--------+------+-------+
6 rows in set (0.00 sec)

mysql> # create view
mysql> create view job_view as (select Emp_name, Job from Emp );
Query OK, 0 rows affected (0.13 sec)

mysql> # show view
mysql> select * from job_view;
+-----------+------------+
| Emp_name  | Job        |
+-----------+------------+
| Steven    | Marketing  |
| Neena     | FI_ACCOUNT |
| Lex       | FI_MGR     |
| Alexander | Sa_Rep     |
| Bruce     | IT_PROG    |
| Jack      | FI_MGR     |
+-----------+------------+
6 rows in set (0.00 sec)

mysql> # update data in Emp
mysql> update Emp set Job = 'MK_MGR' where Emp_name = 'Steven';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> # show view and verify update is reflected
mysql> select * from job_view;
+-----------+------------+
| Emp_name  | Job        |
+-----------+------------+
| Steven    | MK_MGR     |
| Neena     | FI_ACCOUNT |
| Lex       | FI_MGR     |
| Alexander | Sa_Rep     |
| Bruce     | IT_PROG    |
| Jack      | FI_MGR     |
+-----------+------------+
6 rows in set (0.00 sec)

mysql> # show Emp and verify update is reflected
mysql> select * from Emp;
+--------+-----------+------------+------------+--------+------+-------+
| EMP_no | Emp_name  | Job        | Hiredata   | Salary | Comm | Depno |
+--------+-----------+------------+------------+--------+------+-------+
|      1 | Steven    | MK_MGR     | 1995-01-06 |    999 | NULL |     2 |
|      2 | Neena     | FI_ACCOUNT | 1987-02-06 |    999 | NULL |     1 |
|      3 | Lex       | FI_MGR     | 1980-01-06 |    999 | NULL |     1 |
|      4 | Alexander | Sa_Rep     | 1987-06-06 |  20000 | NULL |     4 |
|      5 | Bruce     | IT_PROG    | 1990-07-06 |    999 | NULL |     4 |
|      6 | Jack      | FI_MGR     | 1980-08-06 |    999 | NULL |     5 |
+--------+-----------+------------+------------+--------+------+-------+
6 rows in set (0.00 sec)

mysql> 
