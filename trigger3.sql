/*
Test 2:
Write a PL/SQL program to create a trigger before insert
for each row and not allowing transaction on weekends.
*/

drop table Student;
create table Student(Rollno int primary key, name varchar(20), address varchar(50));
insert into Student values(104, 'Bob', 'Address1');

drop trigger trigger3;
CREATE OR REPLACE TRIGGER trigger3
BEFORE INSERT ON Student
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
IF TO_CHAR(SYSDATE, 'D') <> '7' THEN
dbms_output.put_line('Error..! Cannot insert record on weekdays');
RAISE_APPLICATION_ERROR(-20000, 'Cannot insert record on weekdays');
END IF;
END;

insert into Student values(103, 'Alice', 'Address2');
