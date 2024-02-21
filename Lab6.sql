set serveroutput on
create procedure proc1(p1 varchar(10),p2 varchar(10))

begin
    call dbms_output.put('p1 = '||p2)
    call dbms_output.put('p2 = '||p2)
    call dbms_output.new_line
end;