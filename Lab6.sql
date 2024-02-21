set serveroutput on

-- below is an example procedure to get familiarized with pl/sql
-- create or replace procedure proc1
-- ( p1 in varchar  , p2 in varchar )
-- as
-- begin
--      dbms_output.put_line('p1 = '|| p1);
--      dbms_output.put_line('p2 = '|| p2);
--      dbms_output.new_line;
-- end;
-- /


--q3 of lab6
create or replace function total_accidents_year
( acc_year in varchar )
return  NUMBER
is
    total_accident_count NUMBER := 0 ;
begin   
    select count(*)
    into total_accident_count
    from ACCIDENT
    where EXTRACT(year from accd_date) = to_number(acc_year);

    return total_accident_count;
exception
    when no_data_found then 
        return 0 ;
end;
/

declare 
ans number ;
begin   
    ans := total_accidents_year('2023');
    dbms_output.put_line('Total accidents in 2023: ' || ans);
end;
/

-- Total accidents in 2023: 3

--q4
create or replace function total_fine 
( IPyear in number , dName in varchar )
return number 
is 
    damagage_amt number :=0;
begin
    select fineamt 
    into damagage_amt
    from participated part
    join person p on p.driver_id= part.driver_id
    where p.driver_name = dName ;

    return damagage_amt;
exception
    when no_data_found then 
        return 0;
end;
/

declare
ans number ;
begin 
    ans := total_fine(2023,'Harsh') ;
    dbms_output.put_line('Total Damage by Harsh: ' || ans);
end;
/

-- Total Damage by Harsh: 8000


-- q5 ??
create or update procedure AccdInfor 
( AccdLoc in varchar)
