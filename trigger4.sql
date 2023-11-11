/*
Sapple 3
Book_avail (bookid, title, no_of _copies, price)
Student (st_id,name,class,fine)
Issue_tab (st_id, book_id, issuedate, returndate)

Create a database trigger to calculate the fine based on the rules given below.
After 1 month 5% of price
After 2 month 10% of price
After 3 month 20% of price.
*/
drop table Book_avail;
drop table Student;
drop table Issue_tab;
create table Book_avail(bookid int primary key, title varchar(20), no_of_copies int,
ice int);
create table Student(st_id int primary key, name varchar(20), class varchar(10), fine int

create table Issue_tab(st_id int, book_id int, issue_date date , return_date date,
imary key(st_id, book_id));

insert into Student values(100, 'Alice', 'CSE', 0);
insert into Student values(101, 'Bob', 'CSE', 0);
insert into Book_avail values(1, 'Data Structure', 10, 1000);
insert into Book_avail values(2, 'Java - Complete ref', 10, 1000);

--TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss')
insert into Issue_tab values(100, 1, TO_DATE('2022/01/01','%yyyy-%mm-%dd'), TO_DATE(
022/02/01','yyyy-%mm-%dd'));
insert into Issue_tab values(101, 2, TO_DATE('2022/01/01','%yyyy-%mm-%dd'), TO_DATE(
022/03/01','yyyy-%mm-%dd'));
select * from Issue_tab;
select * from Student;
select * from Book_avail;
drop trigger trigger4;

CREATE OR REPLACE TRIGGER trigger4
BEFORE UPDATE ON Issue_tab
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
bprice int;
months int;
latefine int;
BEGIN
select price into bprice from Book_avail where bookid=1;
months:=months_between(:new.return_date,:old.issue_date);
dbms_output.put_line('months = ' || months);

-- Calculate fine while update issue_tab
if months>=1 and months<2 then
latefine := bprice*0.05;
else if months>=2 and months<3 then
latefine := bprice*0.01;
else if months>=3 then
latefine := bprice*0.2;
end if;
end if;
end if;

-- Update fine into Student table while update issue_tab
dbms_output.put_line('latefine = ' || latefine);
update Student set fine=latefine where st_id=:old.st_id;
END;

/* Update statement to test trigger */
update Issue_tab set return_date=TO_DATE('2022/03/02','%yyyy-%mm-%dd') where st_id=100;
select * from Student;
