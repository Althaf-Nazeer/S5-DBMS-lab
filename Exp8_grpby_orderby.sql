show databases;
create database lab8_tables;
use lab8_tables;
2.
create table Dept(department_id int primary key , department_name VARCHAR(20) NOT
NULL , manager_id int, loc varchar(10));
create table Emp(EMP_no int primary key, Emp_name varchar(10), Job varchar(10),
Hiredata date, Salary float, Comm Float, Depno int references Dept(department_id));
3. Insert Data into both tables
INSERT INTO Emp VALUES(1,'Steven', 'Marketing', STR_TO_DATE('06-jan-1995',
'%d-%M-%Y'),24000, NULL,2);
INSERT INTO Emp VALUES(2,'Neena', 'FI_ACCOUNT', STR_TO_DATE('06-feb-1987',
'%d-%M-%Y'),34000, NULL,1);
INSERT INTO Emp VALUES(3,'Lex', 'FI_MGR', STR_TO_DATE('06-jan-1980',
'%d-%M-%Y'),240000, NULL,1);
INSERT INTO Emp VALUES(4,'Alexander', 'Sa_Rep', STR_TO_DATE('06-jun-1987',
'%d-%M-%Y'),20000, NULL,4);
INSERT INTO Emp VALUES(5,'Bruce', 'IT_PROG',STR_TO_DATE('06-jul-1990',
'%d-%M-%Y'),24000, NULL,4);
INSERT INTO Emp VALUES(6,'David', 'IT_PROG', STR_TO_DATE('06-sep-1991',
'%d-%M-%Y'),22000, NULL,4);
INSERT INTO Emp VALUES(7,'vipin', 'IT_PROG', STR_TO_DATE('16-nov-1987',
'%d-%M-%Y'),28000, NULL,4);
INSERT INTO Emp VALUES(8,'Diana', 'Pur_Man', STR_TO_DATE('26-jan-1987',
'%d-%M-%Y'),24000, NULL,3);
INSERT INTO Emp VALUES(9,'John', 'FI_ACCOUNT',STR_TO_DATE('1-dec-1992',
'%d-%M-%Y'), 24000, NULL,1);
INSERT INTO Emp VALUES(10,'Ismael', 'CLERK', STR_TO_DATE('29-mar-1994', '%d-%M-%Y'),
4000, NULL,3);
INSERT INTO Emp VALUES(11,'Mathew', 'CLERK', STR_TO_DATE('12-oct-1992', '%d-%M-%Y'),
46000, 200,3);
INSERT INTO Emp VALUES(12,'Hayes', 'Marketing', STR_TO_DATE('21-apr-1998',
'%d-%M-%Y'), 14000, 1000,3);
INSERT INTO Emp VALUES(13,'sarun', 'Marketing', STR_TO_DATE('18-may-1993',
'%d-%M-%Y'), 18000, NULL,2);
INSERT INTO Emp VALUES(14,'Henin', 'FI_MGR', STR_TO_DATE('06-aug-1980', '%d-%M-%Y'),
240000, NULL,1);
INSERT INTO Emp VALUES(15,'Greesh','Clerk', STR_TO_DATE('06-aug-1980',
'%d-%M-%Y'),240000, NULL,5);
INSERT INTO Dept values(1, 'Administration', null, 'Boston');
INSERT INTO Dept values(2, 'Marketing', null, 'Boston');
INSERT INTO Dept values(3, 'Purchase', null, 'perryridge');
INSERT INTO Dept values(4, 'Programming',null, 'Hudson');
INSERT INTO Dept values(5, 'HR', null, 'Hudson');

4.
alter table Dept add foreign key(manager_id) references Emp(EMP_no);
update Dept set manager_id=2 where department_id=1;
update Dept set manager_id=1 where department_id=2;
update Dept set manager_id=8 where department_id=3;
update Dept set manager_id=7 where department_id=4;
select * from Dept;
5. Do the following queries
#1 Display the name and salary for all employees whose salary is not in the range of 5000 and
35000
select Emp_name, Salary from Emp where Salary not between 5000 and 35000;
#2 Display the employee name, job ID, and start date of employees hired between February
# 20, 1990, and May 1, 1998. Order the query in ascending order by start date.
select Emp_name, Salary, Job, Hiredate from Emp where Hiredate between '1990-02-20' and '1998-
05-01' order by Hiredate;
#3 list the name and salary of employees who earn between 5,000 and12,000, and are in
# department 2 or 4. Label the columns Employee and Monthly Salary,respectively.
SELECT Emp_name 'Employee', Salary 'Monthly Salary', Depno FROM Emp WHERE Salary
BETWEEN 5000 AND 30000 AND Depno IN (2, 4);
#4 Display the name and hire date of every employee who was hired in 1994.
select Emp_name, hiredate from Emp where hiredate like '1994%';
#5 Display the name, salary, and commission for all employees who earn commissions. Sort
# data in descending order of salary and commissions.
select Emp_name, Salary, Comm from Emp where comm >0 order by Salary desc, Comm desc;
#6 Display the name and job title of all employees who do not have a manager.
select Emp_name, Job from Emp, Dept where manager_id is null and Emp.Depno=
Dept.department_id;
#7 Display the names of all employees where the third letter of the name is an a.
select Emp_name from Emp where Emp_name like '__a%';
#8 Display the name of all employees who have an a and an e in their name.
select Emp_name from Emp where Emp_name like '%a%' and emp_name like '%e%';
#9 Display the name, job, and salary for all employees whose job is sales representative or
# stock clerk and whose salary is not equal to 2,0000, 4000, or 7,000.
select Emp_name, Job, Salary from Emp where Job in ('Sa_rep', 'CLERK') and Salary not in (2000,
4000, 7000);

#10 Write a query that displays the employee’s names with the first letter capitalized and all
# other letters lowercase and the length of the name for all employees whose name starts with
# J, A, or M. Give each column an appropriate label. Sort the results by the employees’ names.
select upper(Emp_name) "Name", length(emp_name) "Length" from Emp where Emp_name like
'J%' or Emp_name like 'M%' or Emp_name like 'A%' order by Emp_name;
#11 Write a query to display the name, department number, and department name for al employees.
select Emp.Emp_name, Emp.Depno, Dept.department_name from Emp , Dept where Emp.Depno =
Dept.department_id order by Dept.department_name;
#12 Create a query to display the name and hire date of any employee hired after employee Mathew
select Emp_Name, Hiredate from Emp where ((Hiredate)>any(select Hiredate from Emp where
Emp_Name='Mathew'));
#13 Display the names and hire dates for all employees who were hired before their
# managers, along with their manager’s names and hire dates. Label the columns Employee,
# EmpHired, Manager, and Mgr Hired, respectively.
select E.EMP_no, E.Emp_name 'Employee' , E.Hiredate 'EMP Hire Date' , E.Depno 'dept no',
M.Emp_name 'Manager Name' , M.Hiredate 'Manager Hiredate'

from Emp E, Dept, Emp M
where Dept.manager_id = M.EMP_no
and E.Depno=Dept.department_id
and E.Hiredate < M.Hiredate;

#14 Write a query to display the number of people with the same job.
select Job, COUNT(*) 'No: of Jobs' from Emp group by Job;
#15 Display the manager number and the salary of the lowest paid employee for that
# manager.Exclude anyone whose manager is not known. Exclude any groups where the
# minimum salary is less than 6,000. Sort the output in descending order of salary.
select min(Salary) 'MINIMUM SALARY', manager_id, department_name

from Emp,Dept

where Emp.depno=Dept.department_id and manager_id is not null group by manager_id,
department_name having MIN(Salary) > 6000 order by 'MINIMUM SALARY' desc;
#16 Write a query to display each department’s name, location, number of employees, and the
# average salary for all employees in that department. Label the columns Name, Location, Number
of People,
#and Salary, respectively. Round the average salary to two decimal places
select D.department_name 'Name', D.loc 'Location ', COUNT(*) 'Number of People',
ROUND(AVG(salary),2) 'Salary'

from Emp E, Dept D where E.depno = D.department_id group by

D.department_name, D.loc;
#17 Write a query to display the name and hire date of any employee in the same department as
amit. Exclude JOHN.
select Emp_name, Hiredate from Emp where Depno = (select Depno from Emp where Emp_name =
'John') and emp_name<>'John';

#18 Write a query that displays the employee numbers names of all employees who work in a
# department with any employee whose name contains a u.
select EMP_no, Emp_name, department_name from Emp, Dept where Depno in (select Depno from
Emp where Emp_name like '%u%') and Emp.Depno=Dept.department_id;
#20 display employee name and department name of all employees that work in a department
# that has at least 2 employees. Order the list in alphabetical order first by department name, then
by employee name.
select Emp_name, department_name from Emp, Dept where Emp.depno = Dept.department_id and
Emp.depno in (select Depno from Emp group by Depno having count(*) >3) order by
department_name, Emp_name;
