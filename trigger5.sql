/*
Sapple 4
Create a Table
Customer(id int primary key, name varchar(20),
age int, address varchar(30), sal int);

Create a trigger to display the salary difference between new and old values
before - insert, delete or update of values on the table
*/
drop table Customer;
create table Customer(id int primary key,
name varchar(20), age int, address varchar(30), sal int);

insert into Customer values(1, 'Alice', 20, 'Address1', 10000);
insert into Customer values(2, 'Bob', 30, 'Address2', 20000);
insert into Customer values(3, 'Cindy', 40, 'Address3', 30000);
insert into Customer values(4, 'Sam', 50, 'Address4', 40000);
insert into Customer values(5, 'Eric', 60, 'Address5', 50000);

select * from Customer;

drop trigger trigger5;
CREATE OR REPLACE TRIGGER trigger5
BEFORE DELETE OR INSERT OR UPDATE ON Customer
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE
sal_diff int;
BEGIN
dbms_output.put_line('TRIGGER 5');
if (:new.id <= 0) then
dbms_output.put_line('Error ...! : Invaid ID');
RAISE_APPLICATION_ERROR(-20000, 'Error ...! : Invaid ID ');
else
sal_diff := :new.sal - :old.sal;
dbms_output.put_line('Old Salary = ' || :old.sal);
dbms_output.put_line('New Salary = ' || :new.sal);
dbms_output.put_line('Salary diff = ' || sal_diff);
end if;
END;

/* Update statement to test trigger */
update Customer set sal=30000 where id=1;
select * from Customer;

/* You can also write a sample program to test this trigger */
DECLARE
new_sal int;
cust_id int;
BEGIN
cust_id := &cust_id;
new_sal := &new_sal;
dbms_output.put_line('new_sal = ' || new_sal);
if (cust_id <= 0) then
RAISE_APPLICATION_ERROR(-20000, 'Error ...! : Invaid ID ');
else
update Customer set sal=new_sal where id=cust_id;
end if;
END;
/
