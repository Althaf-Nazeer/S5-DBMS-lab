declare cursor cursor0 is
select * from employee order by salary desc;
e_id employee.id%type;
e_name employee.name%type;
e_age employee.age%type;
e_salary employee.salary%type;

begin

open cursor0;
for i in 1 .. 3
loop
fetch cursor0 into e_id,e_name, e_age, e_salary;

exit when cursor0%notfound;
dbms_output.put_line('Emp id : '|| e_id);
dbms_output.put_line('Emp name : '|| e_name);
dbms_output.put_line('Emp age : '|| e_age);
dbms_output.put_line('Emp salary : '|| e_salary);
end loop;
close cursor0;
end;
/
select * from employee;
