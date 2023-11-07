/* addition of two numbers */
DECLARE
a integer := &a;
b integer := &b;
res int;
BEGIN
res := a + b;
dbms_output.put_line('result = ' || res);
END;
