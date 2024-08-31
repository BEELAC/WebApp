Product
    pid
    name
    brand
    price
    color

User
    uid
    name
    phone
    email

ORM
Object Relational Mapping

create table Product(
    pid int,
    name varchar(256),
    brand varchar(256),
    price int,
    color varchar(256),
    ratings float
)

create table User(
    uid int PRIMARY KEY AUTO_INCREMENT,
    name varchar(256),
    phone varchar(16),
    email varchar(256) NOT NULL
);

create table Customer(
    cid int,
    name varchar(256),
    phone varchar(16),
    email varchar(256)
);

Inserting records

insert into User values(null, 'sia', '12345678', 'sia@example.com', 23, 'Bangalore');
insert into User values(null, 'kim', '12347777', 'kim@example.com', 27, 'Bangalore');
insert into User values(null, 'george', '12348888', 'george@example.com', 31, 'Bangalore');
insert into User values(null, 'harry', '12349999', 'harry@example.com', 33, 'Chenna');
insert into User values(null, 'noa', '12342222', 'noa@example.com', 31, 'Chenna');
insert into User values(null, 'jacob', '12343333', 'jacob@example.com', 32, 'Chenna');

Customer
Address

Customer HAS-AN Address     //1 to 1
Customer HAS-MANY Addresses //1 to MANY


create table Customer(
    cid int primary key auto_increment,
    name varchar(256),
    phone varchar(20),
    email varchar(256)
);

create table Address(
    aid int primary key auto_increment,
    adrsLine varchar(256),
    city varchar(256),
    pincode int,
    cid int,
    constraint fk_customer_address foreign key (cid)
    references Customer(cid)
);

Inserting records

insert into Address values(null, '2121 Easter Heights', 'Chennai', 60001, 2);
insert into Address values(null, '33 Pristine Magnum', 'Bangalore', 520001, 2);
insert into Address values(null, '77 Aashiana', 'Delhi', 110001, 3);
insert into Address values(null, '33 Model Town', 'Bangalore', 60001, 4);
insert into Address values(null, '761 Pinnacle Square', 'Chennai', 60001, 7);
insert into Address values(null, '565 Haven', 'Chennai', 60003, 7);
insert into Address values(null, 'Omaxe Apartments', 'Ludhiana', 141001, 4);
insert into Address values(null, '66 JapyPee Estates', 'Chennai', 60001, 3);

Joins

select Customer.name, Customer.phone, Address.adrsLine, Address.city
from Customer
Inner join Address on Customer.cid = Address.cid;

select Customer.name, Customer.phone, Address.adrsLine, Address.city
from Customer
Left join Address on Customer.cid = Address.cid
Order by Customer.name;

select Address.adrsLine, Address.city, Customer.name, Customer.phone
from Customer
Right join Address on Customer.cid = Address.cid
Order by Customer.name;

select Customer.name, Customer.phone, Address.adrsLine, Address.city
from Customer
FULL OUTER JOIN Address on Customer.cid = Address.cid
Order by Customer.name;