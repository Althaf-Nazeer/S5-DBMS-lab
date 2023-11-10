drop table Account;
create table Account(id int primary key, name varchar(20), bal int);
drop trigger trigger2;

CREATE TRIGGER trigger2
BEFORE INSERT ON Account
FOR EACH ROW
DECLARE
min_bal integer := 0;
BEGIN
IF (:new.bal < min_bal ) THEN
dbms_output.put_line('Error..! Balance cannot be less than zero');
raise_application_error(-20000, 'Balance cannot be less than zero');
END IF;
END;

insert into Account values(100, 'Alice', 200);
insert into Account values(104, 'Bob', 500);

select * from Account;
insert into Account values(102, 'Cindy', -500);
