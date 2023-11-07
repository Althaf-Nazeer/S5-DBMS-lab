SET SERVEROUTPUT ON

select user from dual;
SELECT NAME FROM v$database;
select table_name from dba_tables;
select owner, table_name from all_tables;
select table_name FROM user_tables;
SELECT table_name FROM user_tables ORDER BY table_name;

create table Stud(rollno int primary key,
name char(10),
mark1 float,
mark2 float,
mark3 float);

/* ROLLNO NAME MARK1 MARK2 MARK3
---------- ---------- --------- ---------- ----------
1 aparna 80 90 78
2 amritha 90 92 81
3 binuja 23 18 20
4 cathy 49 50 50
5 danish 60 62 61
6 fayas 76 62 74 */

insert into Stud values(1,'aparna', 80, 90, 78);
insert into Stud values(&rollno, '&name', &mark1, &mark2, &mark3);
select * from Stud;
select name from Stud where rollno=1;


DECLARE
age integer;
name VARCHAR(20);
BEGIN
dbms_output.put_line('Hello world');
--dbms_output.put_line('age = ' || age);
--dbms_output.put_line('name = ' || name);
--insert into Stud values(&rollno, '&name', &mark1, &mark2, &mark3);
END;

select * from Stud;
delete from Stud;
drop table Stud purge;
