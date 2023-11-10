/* SQL Operations */
/* ROLLNO NAME MARK1 MARK2 MARK3
---------- ---------- --------- ---------- ----------
1 aparna 80 90 78
2 amritha 90 92 81
3 binuja 23 18 20
4 cathy 49 50 50
5 danish 60 62 61
6 fayas 76 62 74 */
create table Stud(rollno int primary key,
name char(10),
mark1 float,
mark2 float,
mark3 float);
insert into Stud values(1,'aparna', 80, 90, 78);
insert into Stud values(2,'amritha', 90, 92, 81);
insert into Stud values(3,'binuja', 23, 18, 20);
insert into Stud values(4,'cathy', 49, 50, 50);
insert into Stud values(5,'danish', 60, 62, 61);
insert into Stud values(6,'fayas', 76, 62, 74);

select * from Stud;

/*
Write a PL/SQL program to grade the student according to the following rules
Student(name,rollno,mark1,mark2,mark3)
TOTAL MARKS GRADE
>=250 Distinction
180-250 First Class
120-179 Second Class
80-119 Third Class
<80 Fail
The result should be in the following Format
STUDENT NAME:
ROLL NO :
TOTAL MARKS :
GRADE :
*/
DECLARE
roleNo integer;
No integer;
Name varchar(20);
total integer;
BEGIN
-- get role no from user
roleNo := &roleNo;

--execute sql query
select rollno,name,(mark1+mark2+mark3) into No, Name, total from Stud where
lno=roleNo;

--print output
dbms_output.put_line('---------------------------');
dbms_output.put_line('Roll no : ' || No);
dbms_output.put_line('Name : ' || Name);
dbms_output.put_line('Total Marks : ' || total);
dbms_output.put_line('---------------------------');

--calculate & print grade
if (total >=250 ) then
dbms_output.put_line('Grade = Distinction');
elsif (total < 250 and total >= 180) then
dbms_output.put_line('Grade = First Class');
elsif (total < 180 and total >= 120) then
dbms_output.put_line('Grade = Second Class');
elsif (total < 120 and total >= 80) then
dbms_output.put_line('Grade = Third Class');
else
dbms_output.put_line('Grade = FAIL');
end if;
END;
/
