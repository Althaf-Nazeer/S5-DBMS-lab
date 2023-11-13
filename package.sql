
SQL> @package

Package created.


Package body created.

SQL> @testprogram
Enter value for a1: 2
old   2: e_id number := &a1;
new   2: e_id number := 2;
Customer corresponding to 2 is Bob
Annual Salary of Bob is : 252000

PL/SQL procedure successfully completed.

SQL> @testprogram 
Enter value for a1: 5
old   2: e_id number := &a1;
new   2: e_id number := 5;
Customer corresponding to 5 is Eric
Annual Salary of Eric is : 606000

PL/SQL procedure successfully completed.
///////////////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE PACKAGE Customer_package AS
PROCEDURE Get_emp_name(c_id IN NUMBER, c_name OUT VARCHAR);
FUNCTION Get_annual_salary(c_id IN NUMBER) RETURN NUMBER;
END Customer_package;
/
-- package body
CREATE OR REPLACE PACKAGE BODY Customer_package AS
-- first procedure definition
PROCEDURE Get_emp_name(c_id IN NUMBER, c_name OUT VARCHAR)
IS
BEGIN
SELECT name INTO c_name from Customer where id = c_id;
END Get_emp_name;
-- second function definition
FUNCTION Get_annual_salary (c_id IN NUMBER)
RETURN NUMBER
IS
c_sal NUMBER :=0;
annual_sal NUMBER;
BEGIN
SELECT sal INTO c_sal FROM Customer WHERE id = c_id;
annual_sal := 12 * c_sal;
RETURN (annual_sal);
END;
END Customer_package;
/

/////////////////////////////////////////////////////////////////////////////////////////////////

declare
e_id number := &a1;
e_name varchar(10);
sal number :=0;
begin
Customer_package.Get_emp_name(e_id, e_name);
dbms_output.put_line('Customer corresponding to '||e_id || ' is '|| e_name);
sal := Customer_package.Get_annual_salary(e_id);
dbms_output.put_line('Annual Salary of '||e_name || ' is : '|| sal);
end;
/

//////////////////////////////////////////////////////////////////////////////////////////////////////
