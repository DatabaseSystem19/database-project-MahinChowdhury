-- number of passenger is 2
select * from bookings where num_of_passengers = 2;

--booking of John Doe
select * from bookings where user_id = (select user_id from users where name = 'John Doe');

--Update name and  email
update users set name = 'Raheem Sterling' where user_id=10;
update users set email = 'raheemsterling@gmail.com' where user_id=10;

--Insert new data into user
INSERT INTO users (user_id, name, email, password) VALUES (15, 'Kane William', 'kanewilliam@example.com', 'password15');

--Delete user
delete from users where user_id = 15;

--Union of city name with string starts with 'K'  and substring with 'l'
select city from airports where city like 'K%' union select city from airports where city like '%l%';

-- with max_pass(value) as (select max(num_of_passengers) from bookings)
-- select * from bookings where num_of_passengers = max_pass.value;

--Get count of airlines
select count(*) as number_of_airlines from airlines;
--Get average of price from flights
select avg(price) from flights; 
--Get sum of price from flights
select sum(num_of_passengers) from bookings;
--Get max of price from flights
select max(num_of_passengers) from bookings;
--Get min of price from flights
select min(num_of_passengers) from bookings;

--get airline_id and avg of price after grouping them by airline_id
select airline_id,avg(price) from flights group by airline_id;
select airline_id,avg(price) from flights group by airline_id having avg(price) > 180;

--A query using multiple subquery
select flight_id,arrival_time,departure_time from flights where flight_id = (select flight_id from bookings where user_id=(select user_id from users where name = 'Roger Federer'));

--get booking info where number of passenger is 2 and user name string ends with l.
select * from bookings where num_of_passengers=2 and user_id in (select user_id from users where name like '%l');

--Getting booking info of those where number of passengers are above 2
select * from bookings where num_of_passengers > some(select num_of_passengers from bookings where num_of_passengers>=2);
select * from bookings where num_of_passengers > all(select num_of_passengers from bookings where num_of_passengers>=2);

--Getting airport datas where airport_id would be greater than 3 and it has city 'tt' as substring.
select * from airports where airport_id>=3 and exists(select * from airports where city like '%tt%');

--City name starts with C
select * from airports where city like 'C%';
--City name starts with e
select * from airports where city like '%e';
--City name has substring o
select * from airports where city like '%o%';
--City name has substring o__o
select * from airports where city like '%o__o%';

--natural join flights and airlines
select * from flights natural join airlines;
--natural join flights and airports where airport_id = 5
select * from flights natural join airports where airport_id=5;

select name,email from users join bookings using(user_id);
select name,email from users join bookings on users.user_id=bookings.user_id;

--left join users and bookings
select name,email from users left outer join bookings using(user_id);
--right join users and bookings
select name,email from users right outer join bookings using(user_id);
--full join users and bookings
select name,email from users full outer join bookings using(user_id);
--left join users and bookings
select name,email from users left outer join bookings on users.user_id=bookings.user_id;

--create view user_details as select user_id,name,email from users;