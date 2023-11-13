
create table Student(
	stud_id INT AUTO_INCREMENT PRIMARY KEY DEFAULT 100,
	stud_fname VARCHAR(20),
	stud_lname VARCHAR(20),
	stud_email VARCHAR(20),
	stud_ph VARCHAR(10));
    ALTER TABLE Student AUTO_INCREMENT=100;
    
    create table Subject(
    sub_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(20));
	ALTER TABLE Subject AUTO_INCREMENT=200;

    create table Marks(
    sub_id INT,
    stud_id INT,
    marks INT, 
    PRIMARY KEY(sub_id,stud_id));
    
desc Student;
insert into Student(stud_fname,stud_lname,stud_email,stud_ph) values('shanti','vasan','shantiv@gmail.com',9677483824);
insert into Student(stud_fname,stud_lname,stud_email,stud_ph) values('anjitha','k','anjithak@gmail.com',9574884993);
insert into Student(stud_fname,stud_lname,stud_email,stud_ph) values('riya','khan','riyakhan@gmail.com',9637833993);
select * from student;

desc Subject;
insert into Subject(sub_name) values('chemistry');
insert into Subject(sub_name) values('physics');
insert into Subject(sub_name) values('maths');
select * from Subject;

desc Marks;
insert into Marks(sub_id,stud_id,marks) values(200,100,75);
insert into Marks(sub_id,stud_id,marks) values(200,101,94);
insert into Marks(sub_id,stud_id,marks) values(200,102,60);
insert into Marks(sub_id,stud_id,marks) values(201,100,85);
insert into Marks(sub_id,stud_id,marks) values(201,101,98);
insert into Marks(sub_id,stud_id,marks) values(201,102,70);
insert into Marks(sub_id,stud_id,marks) values(202,100,50);
insert into Marks(sub_id,stud_id,marks) values(202,101,96);
insert into Marks(sub_id,stud_id,marks) values(202,102,45);
select * from Marks;

update Student set stud_lname='rajan' where stud_id=100;
select * from Student where stud_id=100;

update Subject set sub_name='mathematics' where sub_id=202;
select * from Subject where sub_id=202;

update Marks set marks=83 where sub_id=200 AND stud_id=102;
select * from Marks where sub_id=200 and stud_id=102;

select * from Student;
select * from Subject;
select * from Marks;

select *from Student where stud_id=102;

# Write a query to display student name, subject and marks of student ordered by marks.
select stud_fname, sub_name, marks from Student, Subject, Marks where 
Student.stud_id=Marks.stud_id and 
Subject.sub_id=Marks.sub_id 
order by marks;

# Write a query to display student name, subject and marks of students who have marks greater than 70 in physics.
select stud_fname, sub_name, marks from Student,Subject,Marks where 
Student.stud_id=Marks.stud_id and 
Subject.sub_id=Marks.sub_id and 
marks >70 and sub_name ='physics';

# Write a query to display average marks in each subject.
select sub_name, avg(marks) from Student, Subject, Marks where 
Student.stud_id=Marks.stud_id and 
Subject.sub_id=Marks.sub_id group by sub_name;

# Write a query to display the number of students.
select count(stud_id) from Student;

# Write a query to display the maximum and minimum marks obtained by students in each subject.
select sub_name, max(marks), min(marks) from Student, Subject, Marks where 
Student.stud_id=Marks.stud_id and Subject.sub_id=Marks.sub_id group by sub_name;

# Write a query to display the details of a student whose name begins with S.
select * from Student where stud_fname like 's%';

# Write a query to display the details of a student whose first name contains a in the fourth place.
select * from Student where stud_fname like '___a';

# Write a query to display the name,subject and marks of students having marks between 50 and 75.
select stud_fname, sub_name, marks from Student, Subject, Marks where 
Student.stud_id=Marks.stud_id and 
Subject.sub_id=Marks.sub_id and 
marks between 50 and 75;

#Create a view to display student name and marks
create view student_view as select stud_fname, stud_lname, sub_name,marks from 
Student, Subject, Marks where 
Student.stud_id=Marks.stud_id and 
Subject.sub_id=Marks.sub_id;

select * from student_view;
