DECLARE
    TYPE intarray IS VARRAY(10) OF INTEGER;
    a intarray;
    first INTEGER;
    mid INTEGER;
    last INTEGER;
    flag BOOLEAN;
    key INTEGER;
BEGIN
    key := 10;
    first :=0;
    last :=10;
    flag := FALSE;
    a := intarray(1,2,3,4,5,6,7,8,9,10);

    WHILE(first <= last) LOOP
        BEGIN
        mid := (first + last) / 2;
        IF(a(mid) = key)
        THEN
            dbms_output.put('number found @ ');
            dbms_output.put_line(mid);
            flag := TRUE;
        EXIT;
        END IF;

        IF(a(mid) > key)
        THEN
            last := mid -1;
        ELSE
            first := mid + 1;
        END IF;
        END;
    END LOOP;

    IF(NOT flag) 
    THEN
        dbms_output.put_line('number not found');
    END IF;

END;
