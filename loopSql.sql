/* Use of loops */
DECLARE
type intArray IS VARRAY(10) OF INTEGER;
type namesArray IS VARRAY(5) OF VARCHAR2(5);

arr intArray;
names namesArray;
i integer;

BEGIN
arr := intArray(1,5,2,3,6,7,4,8,9,10);
names := namesArray('Alice', 'Bob', 'Cindy', 'Sam', 'Eric');

i := 1;
/*While loop...! */
while( i <= 10) loop
dbms_output.put_line('arr[' || i ||'] =' ||arr(i));
i := i+1;
end loop;

/*For loop...! */
for i in 1 .. 10 loop
dbms_output.put_line('arr[' || i ||'] =' ||arr(i));
end loop;

i := 1;
while( i <= 5) loop
dbms_output.put_line('names[' || i ||'] =' ||names(i));
i := i+1;
end loop;

/*For loop...! */
for i in 1 .. 5 loop
dbms_output.put_line('names[' || i ||'] =' ||names(i));
end loop;
END;
