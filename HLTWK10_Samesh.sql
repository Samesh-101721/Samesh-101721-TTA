create database customer;

show databases;

use customers;

create table customer_details(
customer_id int not null,
first_name varchar(25) not null,
last_name varchar (35) not null,
email varchar(100) not null unique,
street varchar (100),
city varchar (20),
postcode varchar (10) not null unique,
primary key (customer_id)
);

explain customer_details;