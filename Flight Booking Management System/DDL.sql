drop table bookings;
drop table flights;
drop table airlines;
drop table airports;
drop table users;

--Creation of schema tables.
CREATE TABLE Users (
  user_id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);


CREATE TABLE Airports (
  airport_id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL
);

CREATE TABLE Airlines (
  airline_id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  iata_code VARCHAR(3) NOT NULL
);

CREATE TABLE Flights (
  flight_id INTEGER PRIMARY KEY,
  airline_id INTEGER NOT NULL,
  departure_airport_id INTEGER NOT NULL,
  arrival_airport_id INTEGER NOT NULL,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
  FOREIGN KEY (departure_airport_id) REFERENCES Airports(airport_id),
  FOREIGN KEY (arrival_airport_id) REFERENCES Airports(airport_id)
);

CREATE TABLE Bookings (
  booking_id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  flight_id INTEGER NOT NULL,
  booking_date DATE NOT NULL,
  num_of_passengers INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert data into Users table
INSERT INTO users (user_id, name, email, password) VALUES (1, 'John Doe', 'johndoe@gmail.com', 'password1');
INSERT INTO users (user_id, name, email, password) VALUES (2, 'Kane Williamson', 'kanewilliamson@gmail.com', 'password2');
INSERT INTO users (user_id, name, email, password) VALUES (3, 'Brenden Rogers', 'brendonrogers@gmail.com', 'password3');
INSERT INTO users (user_id, name, email, password) VALUES (4, 'Martin Guptil', 'martinguptil@gmail.com', 'password4');
INSERT INTO users (user_id, name, email, password) VALUES (5, 'Benzamin Mendy', 'benzaminmendy@gmail.com', 'password5');
INSERT INTO users (user_id, name, email, password) VALUES (6, 'Roger Federer', 'rogerfederer@gmail.com', 'password6');
INSERT INTO users (user_id, name, email, password) VALUES (7, 'Rafael Nadal', 'rafaelnadal@gmail.com', 'password7');
INSERT INTO users (user_id, name, email, password) VALUES (8, 'James Henderson', 'jameshenderson@gmail.com', 'password8');
INSERT INTO users (user_id, name, email, password) VALUES (9, 'David Beckham', 'davidbeckham@gmail.com', 'password9');
INSERT INTO users (user_id, name, email, password) VALUES (10, 'Harry Maguire', 'harrymaguire@gmail.com', 'password10');

-- Insert data into Airlines table
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (1, 'Qatar Airways', 'A1');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (2, 'Singapore Airlines', 'A2');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (3, 'Emirates', 'A3');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (4, 'Turkish Airlines', 'A4');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (5, 'Bangladesh Biman', 'A5');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (6, 'French airlines', 'A6');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (7, 'China Airlines', 'A7');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (8, 'Korean Air', 'A8');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (9, 'British Airways', 'A9');
INSERT INTO Airlines (airline_id, name, iata_code) VALUES (10, 'Air Canada', 'A10');

-- Insert data into Airports table
INSERT INTO Airports (airport_id, name, city, country) VALUES (1, 'Airport 1', 'Khulna', 'Bangladesh');
INSERT INTO Airports (airport_id, name, city, country) VALUES (2, 'Airport 2', 'Dhaka', 'Bangladesh');
INSERT INTO Airports (airport_id, name, city, country) VALUES (3, 'Airport 3', 'London', 'England');
INSERT INTO Airports (airport_id, name, city, country) VALUES (4, 'Airport 4', 'Seattle', 'United States');
INSERT INTO Airports (airport_id, name, city, country) VALUES (5, 'Airport 5', 'California', 'United States');
INSERT INTO Airports (airport_id, name, city, country) VALUES (6, 'Airport 6', 'Brisbon', 'Australia');
INSERT INTO Airports (airport_id, name, city, country) VALUES (7, 'Airport 7', 'Moscow', 'Russia');
INSERT INTO Airports (airport_id, name, city, country) VALUES (8, 'Airport 8', 'Berlin', 'Germany');
INSERT INTO Airports (airport_id, name, city, country) VALUES (9, 'Airport 9', 'Paris', 'France');
INSERT INTO Airports (airport_id, name, city, country) VALUES (10, 'Airport 10', 'Beijing', 'China');


-- Insert data into Flights table
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES (1, 1, 1, 2, '21-MAY-2023 4:30:00', '21-MAY-2023 6:30:00', 150.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(2, 1, 2, 3, '22-MAY-2023 1:30:00', '22-MAY-2023 2:30:00', 200.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(3, 2, 3, 4, '23-MAY-2023 09:45:00', '23-MAY-2023 11:45:00', 180.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(4, 2, 4, 5, '24-MAY-2023 10:15:00', '24-MAY-2023 12:15:00', 220.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(5, 3, 5, 6, '25-MAY-2023 11:30:00', '25-MAY-2023 12:30:00', 190.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(6, 3, 6, 7, '26-MAY-2023 6:45:00', '26-MAY-2023 8:45:00', 210.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(7, 4, 7, 8, '27-MAY-2023 08:00:00', '27-MAY-2023 10:00:00', 170.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(8, 4, 8, 9, '28-MAY-2023 2:30:00', '28-MAY-2023 4:30:00', 230.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(9, 5, 9, 10, '29-MAY-2023 5:15:00', '29-MAY-2023 7:15:00', 200.00);
INSERT INTO Flights (flight_id, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price) VALUES(10, 5, 10, 1, '30-MAY-2023 09:30:00', '30-MAY-2023 11:30:00', 180.00);


-- Insert data into Bookings table

INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (1, 1, 1, '21-MAY-2023', 2);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (2, 1, 2, '22-MAY-2023', 1);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (3, 2, 3, '23-MAY-2023', 3);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (4, 3, 4, '24-MAY-2023', 1);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (5, 4, 5, '25-MAY-2023', 2);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (6, 5, 6, '26-MAY-2023', 4);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (7, 6, 7, '27-MAY-2023', 1);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (8, 7, 8, '28-MAY-2023', 2);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (9, 8, 9, '29-MAY-2023', 3);
INSERT INTO Bookings (booking_id, user_id, flight_id, booking_date, num_of_passengers) VALUES (10, 9, 10,'30-MAY-2023', 1);