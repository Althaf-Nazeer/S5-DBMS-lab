use dbms_exp;
create table Student(
	stud_id INT  PRIMARY KEY,
	stud_fname VARCHAR(20),
	stud_lname VARCHAR(20),
	stud_email VARCHAR(20),
	stud_ph VARCHAR(10));

show tables;

select * from Student;

LOAD DATA INFILE '/var/lib/mysql-files/student.csv' INTO TABLE Student FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS;

select * from Student;
