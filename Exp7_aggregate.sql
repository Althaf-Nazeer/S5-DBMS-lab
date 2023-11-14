drop database student;
create database student;
use student;
create table Faculty (F_Code int Primary Key, F_Name varchar(15));
insert into Faculty values(101, 'Silgy');
insert into Faculty values(102, 'Bindu');
insert into Faculty values(103, 'Vidhya');
insert into Faculty values(104, 'Sangeetha');
insert into Faculty values(105, 'Jayakumar');
create table Subject (subjectcode varchar(5) primary key not null,
subjectname char(15),
maxmark int,
faculty_code int,
foreign key(faculty_code) references Faculty(F_code));

insert into Subject(subjectcode,subjectname,maxmark,faculty_code) values(501,'Maths', 150, 101);
insert into Subject(subjectcode,subjectname,maxmark,faculty_code) values(502,'FCA', 100, 102);
insert into Subject(subjectcode,subjectname,maxmark,faculty_code) values(503,'DBMS', 100, 105);
insert into Subject(subjectcode,subjectname,maxmark,faculty_code) values(504, 'OS',75, 103);
insert into Subject(subjectcode,subjectname,maxmark,faculty_code) values(505, 'DC',200, 104);
insert into Subject(subjectcode,subjectname,maxmark,faculty_code) values(508, 'DBMSLab', 1001, 103);
select * from Subject;
create table Student(studentcode varchar(5) primary key not null,
studentname char(15),
dob date,
studentbranch char(3),
adate date,
check(studentbranch in('cs','ec','ee','me')));

insert into Student values(1,'Amitha',STR_TO_DATE('12-jan-1987', '%d-%M-%Y'),'cs',STR_TO_DATE('1-jun-2000', '%d-%M-%Y'));
insert into Student values(2,'vaidehi',STR_TO_DATE('25-dec-88', '%d-%M-%Y'),'cs',STR_TO_DATE('1-jun-2000', '%d-%M-%Y'));
insert into Student values(3,'varun',STR_TO_DATE('2-oct-88', '%d-%M-%Y'),'cs',STR_TO_DATE('2-jun-2000', '%d-%M-%Y'));
insert into Student values(4,'turner',STR_TO_DATE('5-sep-88', '%d-%M-%Y'),'cs',STR_TO_DATE('2-jun-2000', '%d-%M-%Y'));
insert into Student values(5,'vani',STR_TO_DATE('20-jul-88', '%d-%M-%Y'),'cs',STR_TO_DATE('5-jun-2000', '%d-%M-%Y'));
insert into Student values(6,'binu',STR_TO_DATE('13-aug-88', '%d-%M-%Y'),'cs',STR_TO_DATE('10-jun-2000', '%d-%M-%Y'));
insert into Student values(7,'chitra',STR_TO_DATE('14-nov-86', '%d-%M-%Y'),'cs',STR_TO_DATE('9-jun-2000', '%d-%M-%Y'));
insert into Student values(8,'dona',STR_TO_DATE('2-dec-91', '%d-%M-%Y'),'cs',STR_TO_DATE('2-jun-2000', '%d-%M-%Y'));
insert into Student values(9,'elana',STR_TO_DATE('5-feb-90', '%d-%M-%Y'),'cs',STR_TO_DATE('2-jun-2000', '%d-%M-%Y'));
insert into Student values(10,'fahan',STR_TO_DATE('20-mar-88', '%d-%M-%Y'),'cs',STR_TO_DATE('5-jun-2000', '%d-%M-%Y'));
insert into Student values(11,'ginu',STR_TO_DATE('13-apr-88', '%d-%M-%Y'),'cs',STR_TO_DATE('10-jun-2000', '%d-%M-%Y'));
insert into Student values(12,'hamna',STR_TO_DATE('14-may-85', '%d-%M-%Y'),'cs',STR_TO_DATE('9-jun-2000', '%d-%M-%Y'));
create table M_mark(
studentcode varchar(5) references Student(studentcode),
subjectcode varchar(5) references
Subject(subjectcode),
mark int,
primary key(studentcode,subjectcode));
insert into M_mark values(1,501,40);
insert into M_mark values(1,502,70);
insert into M_mark values(1,503,50);
insert into M_mark values(1,504,80);
insert into M_mark values(1,505,40);
insert into M_mark values(1,508,70);
insert into M_mark values(2,501,90);
insert into M_mark values(2,502,89);
insert into M_mark values(2,503,77);
insert into M_mark values(2,504,95);
insert into M_mark values(2,505,74);
insert into M_mark values(2,508,98);
insert into M_mark values(3,501,40);
insert into M_mark values(3,502,43);
insert into M_mark values(3,503,40);
insert into M_mark values(3,504,40);
insert into M_mark values(3,505,40);
insert into M_mark values(3,508,35);
insert into M_mark values(4,501,50);
insert into M_mark values(5,501,60);
insert into M_mark values(6,501,67);
insert into M_mark values(7,501,23);
insert into M_mark values(8,501,43);
insert into M_mark values(9,501,42);
insert into M_mark values(10,505,74);
insert into M_mark values(11,508,98);
insert into M_mark values(12,501,40);
insert into M_mark values(5,502,43);
insert into M_mark values(6,503,40);
insert into M_mark values(7,504,40);
insert into M_mark values(8,505,40);
insert into M_mark values(9,508,35);
insert into M_mark values(10,501,50);
insert into M_mark values(11,501,60);
insert into M_mark values(12,503,67);
insert into M_mark values(5,504,23);
insert into M_mark values(6,504,23);
insert into M_mark values(9,504,1);
insert into M_mark values(10,504,1);
insert into M_mark values(6,502,43);
insert into M_mark values(7,505,42);
select count(*) "No of Faculty = " from Faculty;
select studentname,sum(mark) "Total Mark" from M_mark,Student where Student.studentcode= M_mark.studentcode group by studentname;
select subjectname,round(avg(mark),2) "Average mark" from Subject,M_mark where Subject.subjectcode= M_mark.subjectcode group by subjectname;
select Subject.subjectname, count(studentname) "NO: OF STUDENTS" from Subject,M_mark, Student where Student.studentcode= M_mark.studentcode and M_mark.mark<(40* maxmark)/100 and Subject.subjectCode=M_mark.subjectcode group by
Subject.Subjectname having count(distinct(M_mark.subjectcode))>=1;
select studentname, subjectname,mark,maxmark,round((M_mark.mark/maxmark)*100,2) "Percentage" from Subject, Student, M_mark where mark<(40*maxmark/100) and
Subject.subjectCode = M_mark. subjectcode and Student.studentcode =M_mark.studentcode;
select Faculty.F_name,Subject.subjectname from Faculty, Subject where Faculty.F_code=Subject.faculty_code;
select F_Name from Faculty where (select count(subjectcode) from Subject where Subject.faculty_code=Faculty.F_Code) > 1 group by Faculty.F_Name;
select studentname,subjectname,mark from Student,Subject,M_mark where Student.studentcode=M_mark.studentcode and Subject.subjectcode=M_mark.subjectcode order by mark;
