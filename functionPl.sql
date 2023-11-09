/* Use of function in pl/sql */
/* Program - findMax value*/
DECLARE
a int;
b int;
c number;
FUNCTION findMax(x int, y int)
RETURN int
IS
z int;
BEGIN
IF x > y THEN
z:= x;
ELSE
Z:= y;
END IF;
RETURN z;
END;

BEGIN
a := &a;
b := &b;

c := findMax(a, b);
dbms_output.put_line(' Maximum of (' || a ||',' ||b || '): ' || c);
END;
