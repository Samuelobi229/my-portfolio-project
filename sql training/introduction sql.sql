# creating a db called tsa_db
create database tsa_db;

# create a table
create table tsa_db.students (
id int(4) primary key auto_increment,
firstname char (20), 
Lastname char (20),
age int(3),
sex enum("male","female"),
state varchar(30),
Created_at datetime default current_timestamp
);

#insert records into the table