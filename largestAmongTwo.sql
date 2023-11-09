-- find the largest of two numbers
DECLARE
a integer := &a;
b integer := &b;
BEGIN

if (a > b) then
dbms_output.put_line(a || ' is the largest number');
else
dbms_output.put_line(b || ' is the largest number');
end if;
END;


/* Use of if elsif ladder */
/* calculate the range of input number */
DECLARE
c integer := &c;
BEGIN
if (c >= 0 and c < 10) then
dbms_output.put_line(' is less than 10');
elsif (c >= 10 and c < 20) then
dbms_output.put_line(' is less than 20');
elsif (c >= 20 and c < 30) then
dbms_output.put_line(' is less than 30');
else
dbms_output.put_line(' is grater than or equal 30');
end if;
END;
