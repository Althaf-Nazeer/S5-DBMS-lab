drop trigger triggerem;
CREATE TRIGGER triggerem
BEFORE INSERT OR UPDATE OF salary ON em
FOR EACH ROW
DECLARE
old_sal integer;
BEGIN
old_sal := :old.salary;
dbms_output.put_line(old_sal);
IF (:new.salary <= old_sal ) 
THEN
dbms_output.put_line('Error..! Salary must be greater than old salary');
rollback;
END IF;
END;
/

update em set salary = 19 where id = 101;
select * from em;
