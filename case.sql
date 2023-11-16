/* Case statement */
/*
Grading ..!
A- > print "Excellent"
B- > print "Very good"
C- > print "Well done"
D- > print "You passed"
F- > print "Better try again"
others - "No such grade"
*/
DECLARE
c char(1) := '&c';
BEGIN
case c
when 'A' then dbms_output.put_line('Excellent');
when 'B' then dbms_output.put_line('Very good');
when 'C' then dbms_output.put_line('Well done');
when 'D' then dbms_output.put_line('You passed');
when 'F' then dbms_output.put_line('Better try again');
else dbms_output.put_line('No such grade');
end case;
END;
