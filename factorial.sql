DECLARE 
   n number := 5;
   f number := 1;  
BEGIN 
    WHILE N > 0 LOOP
            f := f * n;
            n := n-1;
        END LOOP; 
    dbms_output.put_line('factorial is: '|| f );
END; 
