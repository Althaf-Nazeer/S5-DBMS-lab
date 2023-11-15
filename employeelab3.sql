show databases;
create database dbms_exp3;
use dbms_exp3;
CREATE TABLE employee (
			fname VARCHAR(15), minit char, 
			lname varchar(15), ssn char(9) PRIMARY KEY, 
			bdate date, address varchar(30), 
			sex char, salary int(10), 
			super_ssn char(9), dno int(4) );

CREATE TABLE department (
			dnumber int(4) PRIMARY KEY,
			dname varchar(15),
			mgrssn char(9),
			mgrstartdate date );
            
CREATE TABLE dept_locations (
			dnumber int(4),
			dlocation varchar(15),
			primary key (dnumber,dlocation) );

CREATE TABLE project (
			pname varchar(15),
			pnumber int(4) PRIMARY KEY,
			plocation varchar(15),
			dnum int(4) );
            
CREATE TABLE works_on (
			essn char(9),
			pno int(4),
			hours int(4),
			primary key (essn,pno) );
            
CREATE TABLE dependent (
			essn char(9),
			dependent_name varchar(15),
			sex char,
			bdate date,
			relationship varchar(8),
			primary key (essn,dependent_name));
            
ALTER TABLE employee ADD FOREIGN KEY (super_ssn) references employee(ssn);
ALTER TABLE employee ADD FOREIGN KEY (dno) references department(dnumber);
ALTER TABLE department ADD FOREIGN KEY (mgrssn) references employee(ssn);
ALTER TABLE dept_locations ADD FOREIGN KEY (dnumber) references department(dnumber);
ALTER TABLE project ADD FOREIGN KEY (dnum) references department(dnumber);
ALTER TABLE works_on ADD FOREIGN KEY (essn) references employee(ssn);
ALTER TABLE works_on ADD FOREIGN KEY (pno) references project(pnumber);
ALTER TABLE dependent ADD FOREIGN KEY (essn) references employee(ssn);

show tables;
