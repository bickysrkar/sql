/* set operators: Used to jion multiple tables with single query
UNION
UNION ALL
INTERSECT
MINUS
MySQL doesent Support INTERSECT,MINUS.

JOIN is used to combine rows from two or more tables based on a related column between them.
It's typically used when you want to retrieve data from multiple tables and create a new result
set by matching rows from each table based on a common column.

UNION:
UNION is used to combine the result sets of two or more SELECT statements into a single result set.
It removes duplicate rows from the combined result set, so it's often used when you want to retrieve 
distinct values from multiple queries.
It's important to note that UNION requires that the SELECT statements involved have the same number
of columns and that the data types of corresponding columns match.

UNION ALL:
UNION ALL is similar to UNION, but it does not remove duplicate rows. 
It combines all rows from the SELECT statements without any elimination of duplicates.
Use UNION ALL when you want to combine all rows from multiple queries, including duplicate rows if they exist.
*/
use class;
drop table t1,t2;
create table t1(id int, name char(20));
insert into t1 values(1,"chetana"),(2,"sahil"),("3","trupti"),(4,"sayali");
select * from t1;

create table t2(id int, name char(20));
insert into t2 values(0,"priyanka"),(1,"sarthak"),("3","trupti"),(4,"gauri");
select * from t2;

select id,name from t1 union select id,name from t2;
select id,name from t1 union all select id,name from t2;

select id from t1 
where name="chetana"
union 
select id from t2
where name="trupti";
use ipcs;
show tables;
select * from ipcs_data;


use class;
create table Departments(Dept_ID int, Dept_Name varchar(25),Student_name varchar(25),Joinig_date date);
select * from Departments;
desc Departments;
insert into Departments values(1,"Electrical","Sarthak","2023-04-08");
insert into Departments values(2,"Electrical","chetana","2023-06-08");
insert into Departments values(3,"Mechanical","Sahil","2023-09-06");
insert into Departments values(4,"Computer","Sayli","2023-08-08");
insert into Departments values(1,"Electrical","Sarthak",null);
select * from Departments;
alter table Departments add column city int not null;
alter table Departments
modify column city  varchar(25)  not null;  /* not null constraint*/

insert into Departments values(1,"Electronics","Priyanks",null,"Ratnagiri");
insert into Departments values(5,"computer","Trupti",null,null);

alter table Departments
modify column Dept_ID  int  unique ;  /* unique constraint*/

drop table if exists person;
create table person(ID int auto_increment primary key,lastname varchar(25) not null,firstname varchar(25) unique);
select * from person;
alter table person add column age int check (age>=18);  /* check constraint*/

insert into person values(1,"vasave","chetana",26);
insert into person values(3,"jaiswal","sarthak",27);
use class;
drop table person;
drop table if exists person;
create table person(ID int auto_increment primary key,lastname varchar(25) not null,firstname varchar(25) unique,age int,city varchar(25),
constraint Check_person check (age>=20 and city="pune"));
create table person(
emp int not null);
select * from person;
create table person(ID int auto_increment primary key,lastname varchar(25) not null,firstname varchar(25) unique,city varchar(25) default "Pune"); /*default constraint*/
insert into person values(2,"vasave","sahil","rar");
insert into person values(3,"ghdav","sarthak","mumbai");
insert into person values(9,"iuildlk","sjhhgs",null);
insert into person values(10,"iuilsu","vbsdbh","Pune");
insert into person (ID,lastname,firstname) values(11,"ssa","cs");

/* index constraint is used to retrive data from database fasteer than any other way */
use students;
select * from  person;
create index index_name
on person (ID,lastname ,firstname,city);
show indexes from person ;

select * from departments;
create index ABC
on departments (Dept_ID,Dept_Name);
show indexes from departments ;

drop index ABC on departments;


/**Autoincrement*/
create table person(Person_ID int not null auto_increment,lastname varchar(25),primary key (Person_ID));
select * from person;
alter table person
auto_increment =100;

insert into person values(1,"vasave");

select * from departments;
create view ABC as
select Dept_ID,Student_name from departments
where Dept_ID=3;
drop view ABC;
use students;
select * from account_data;
insert into account_data values(3,"Sayali",50000);

use sys;

drop table account_data;
create table account_data(acc_id int,acc_name char(25),balance int);
insert into account_data values(1,"vipul",50000);
insert into account_data values(2,"NIkki",20000),(3,"Vishal",4000);
select * from account_data;
start transaction;
insert into account_data values(11,"harshda",56000); 
select * from account_data;
rollback;
select *from account_data;
insert into account_data values(11,"harshda",56000); 
select * from account_data;

start transaction;
update account_data set acc_Name="sejal" where acc_id=1;
insert into account_data values(11,"harshda",56000); 
insert into account_data values(22,"sashank",23000); 
select * from account_data ;