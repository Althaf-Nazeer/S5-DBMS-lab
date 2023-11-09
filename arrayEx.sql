/* use of array*/
/* index starts with 1 .. not 0 */
DECLARE
type intArray IS VARRAY(10) OF INTEGER;
type namesArray IS VARRAY(5) OF VARCHAR2(5);

arr intArray;
names namesArray;
i integer;

BEGIN
arr := intArray(1,5,2,3,6,7,4,8,9,10);
names := namesArray('Alice', 'Bob', 'Cindy', 'Sam', 'Eric');
dbms_output.put_line('Integer array');
--dbms_output.put_line('arr[0]' || arr(0));
dbms_output.put_line('arr[1]' || arr(1));
dbms_output.put_line('arr[2]' || arr(2));
dbms_output.put_line('arr[3]' || arr(3));
END;
