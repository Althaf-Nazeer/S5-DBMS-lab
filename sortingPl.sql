/* Sorting algorithm...! */
DECLARE
type intArray IS VARRAY(10) OF INTEGER;
arr1 intArray;
i int;
j int;
c int;
temp INTEGER := 0;
FUNCTION sortArray(arr IN OUT intArray, len integer)
RETURN int
IS
ret int;
BEGIN
ret := 1;
dbms_output.new_line;
for i in 1 .. len loop
dbms_output.put_line('arr[' || i ||'] =' ||arr(i));
end loop;

for i in 1 .. len loop
for j in 1+i .. len loop
if (arr(i) > arr(j)) then
temp := arr(i);
arr(i) := arr(j);
arr(j) := temp;
end if;
end loop;
end loop;

for i in 1 .. len loop
dbms_output.put_line('arr[' || i ||'] =' ||arr(i));
end loop;

return ret;
END;

BEGIN
arr1 := intArray(1,5,2,3,6,7,4,8,9,10);
c := sortArray(arr1, 10);
END;
