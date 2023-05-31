--Creating a add_user procedure
create or replace procedure add_users(v_userid in users.user_id%type,v_name in users.name%type,v_email in USERS.EMAIL%type,v_pass in USERS.PASSWORD%type)
is

Begin
    insert into users values(v_userid,v_name,v_email,v_pass);
    dbms_output.put_line('User Added');
    
End;
/

--Executing add_user procedure
set serveroutput on

Begin
    add_users(12,'Karim Benzema' , 'karimbenzema@gmail.com','password12');
    
End;
/

-- Search for email of a person using procedure
create or replace procedure searchForEmail(v_name IN USERS.NAME%type,v_email OUT users.email%type) is

Begin
    select email into v_email from users where name = v_name;
    
End;
/
--Execution of searchForEmail
Declare
    v_email users.email%type;
    
Begin
    searchForEmail('Karim Benzema',v_email);
    
    dbms_output.put_line(v_email);
    
End;
/

--Row type

set serveroutput on
Declare
    flight_row flights%rowtype;
Begin
    select flight_id,departure_time, arrival_time, price into flight_row.flight_id,flight_row.departure_time,flight_row.arrival_time,flight_row.price from flights where price = 150.0;
    dbms_output.put_line(flight_row.departure_time || '|' || flight_row.arrival_time || '|' || flight_row.price);
End;
/

-- Get flight datas using cursor
set serveroutput on

Declare
cursor f_cursor is select flight_id,arrival_time,departure_time,price from flights;
f_row flights%rowtype;

Begin
    open f_cursor;
    fetch f_cursor into f_row.flight_id,f_row.arrival_time,f_row.departure_time,f_row.price;
    
    while f_cursor%found loop
        dbms_output.put_line(f_row.flight_id || '|' || f_row.arrival_time || '|' || f_row.departure_time || '|' || f_row.price);
        fetch f_cursor into f_row.flight_id,f_row.arrival_time,f_row.departure_time,f_row.price;
        
    End loop;
    
    close f_cursor;
    
End;
/
-- Creating a function to get price above a given price
set serveroutput on;
create or replace function gethighprice(p_value in number) return number AS
    res number;

Begin
    select price into res from flights where price > p_value;
    return res;
End;
/

--Execute gethighpirce function

set serveroutput on

declare
res flights.price%type;

begin
    res := gethighprice(225);
    dbms_output.put_line(res);
    
End;
/

--pl sql

SET SERVEROUTPUT ON;
DECLARE
  counter NUMBER;
  flight_name2 flights.flight_name%TYPE;
  TYPE NAMEARRAY IS VARRAY(5) OF flights.flight_name%TYPE; 
  A_NAME NAMEARRAY := NAMEARRAY();
BEGIN
  counter := 1;
  FOR x IN 12..16 LOOP
    SELECT flight_name INTO flight_name2 FROM flights WHERE flight_no = x;
    A_NAME.EXTEND();
    A_NAME(counter) := flight_name2;
    counter := counter + 1;
  END LOOP;
  
  counter := 1;
  WHILE counter <= A_NAME.COUNT LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter := counter + 1;
  END LOOP;
END;
/

      
-- Get username who have flight bookings between two given date :

CREATE OR REPLACE PROCEDURE GetUsersWithFlightBookings(
    pArrivalTime IN flights.arrival_time%TYPE,
    pDepartureTime IN flights.departure_time%TYPE
)
IS
BEGIN
    FOR rec IN (
        SELECT DISTINCT u.name
        FROM users u
        JOIN bookings b ON u.user_id = b.user_id
        JOIN flights f ON b.flight_id = f.flight_id
        WHERE f.arrival_time >= pArrivalTime AND f.departure_time <= pDepartureTime
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('User Name: ' || rec.name);
    END LOOP;
END;
/

-- Execute the getuserswithflightbookins procedure:

set serveroutput on;
begin
    GetUsersWithFlightBookings('26-MAY-2023','28-MAY-2023');
end;
/