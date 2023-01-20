create database Travago;
use Travago;

CREATE TABLE Passenger (
Passenger_id int not null auto_increment,
Passenger_name varchar(15),
Category varchar(15),
Gender varchar(10),
Boarding_city varchar(20),
Destination_city varchar(20),
Distance int,
Bus_Type varchar(20),
primary key (Passenger_id)
);

drop table Passenger;
describe Passenger ;

insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
select * from Passenger;
insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Pallavi","AC","F","Panaji","Bangaluru",600,"Sleeper");
insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper");
insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper");
insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into Passenger (Passenger_name,Category,Gender,Boarding_city,Destination_city,Distance,Bus_Type)
Values ("Piyush","AC","M","Pune","Nagpur",700,"Sitting");
select * from Passenger;

Create table Price(
Passenger_id int,
Bus_Type varchar(20),
Distance int,
Price int,
foreign key(Passenger_id) references Passenger(Passenger_id)
);

drop table Price;
describe price;

insert into Price (Passenger_id,Bus_Type,Distance,Price) values (1,"Sleeper",350,770);
select * from Price;
drop table price;
drop table Price;
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (2,"Sleeper",500,1100);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (3,"Sleeper",600,1320);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (4,"Sleeper",700,1540);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (5,"Sleeper",1000,2200);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (6,"Sleeper",1200,2640);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (7,"Sleeper",1500,2700);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (8,"Sitting",500,620);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (9,"Sitting",600,744);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (10,"Sitting",1000,1240);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (11,"Sitting",600,1320);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (12,"Sitting",1200,1488);
insert into Price (Passenger_id,Bus_Type,Distance,Price) values (13,"Sitting",1500,1860);
select * from Price;
select count(Gender),Gender from Passenger where Distance >= 600 group by Gender; -- Question 1
select min(Price) from Price where Bus_Type = "Sleeper"; -- Question 2
select Passenger_name from passenger where Passenger_name like "S%"; -- Question 3
Select passenger.Passenger_name,Passenger.Bus_Type,Passenger.Boarding_city,Passenger.Destination_city,Price.Bus_type,Price.Price 
from Passenger
 inner join Price
 on Passenger.Distance = Price.Distance
 where passenger.Bus_Type = price.Bus_Type
 order by price; -- Question 4
Select passenger.Passenger_name,Price.Price 
from Passenger
 inner join Price
 on Passenger.Distance = Price.Distance
 where (passenger.Distance <= 1000) AND (passenger.Bus_Type = "Sitting"); -- Question 5
Select passenger.Passenger_name,passenger.Destination_city as new_boarding_city,Passenger.Boarding_city as new_destination_city,Price.Price,price.Bus_Type  
from Passenger
 inner join Price
 on Passenger.Distance = Price.Distance
 where passenger.Passenger_name = "Pallavi"; -- Question 6
Select Distinct(Distance) From Passenger order by Distance DESC; -- Question 7
select Passenger_name,distance*100/(select sum(Distance) from passenger)
from passenger
group by distance; -- Question 8








