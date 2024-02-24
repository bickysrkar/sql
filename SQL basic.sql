DROP TABLE sys.employee;
use  sys;
CREATE TABLE  sys.employee (
id INT NOT NULL,
E_name VARCHAR(45) NULL,
age VARCHAR(45) NULL,
salary VARCHAR(45) NULL,
PRIMARY KEY(id));
INSERT INTO  sys.Employee(id,E_name,age,salary) VALUES('1','VIPUL','21','10000000');
INSERT INTO  sys.employee(id,E_name,age,salary) VALUES('2','SHRUTI','30','7000000');
INSERT INTO  sys.employee(id,E_name,age,salary) VALUES('3','ASHA','40','900000');
INSERT INTO  sys.employee(id,E_name,age,salary) VALUES('4','ASHWIN','34','8000000');
INSERT INTO  sys.employee(id,E_name,age,salary) VALUES('5','VIBHOR','10','14000000');
INSERT INTO  sys.employee(id,E_name,age,salary) VALUES('6','PRANU','20','4000000');
select * FROM sys.employee; 
-> Addition 
SELECT id ,E_name ,salary, salary+1000000 as New_salary FROM sys.employee
->Substraction
SELECT id ,E_name ,salary, salary-1000000 as New_salary FROM employee
->multip-lication
SELECT id ,E_name ,salary, salary*2 as New_salary FROM employee
->division
SELECT id ,E_name ,salary, salary/2 as New_salary FROM employee
-.Equalto 
SELECT * FROM  employee WHERE salary = 7000000;
->not equalto
SELECT * FROM  employee WHERE salary != 7000000;
->greater than
SELECT * FROM  employee WHERE salary > 7000000;
-.less than 
SELECT * FROM  employee WHERE salary < 7000000;
-.greaster than equalto
SELECT * FROM  employee WHERE salary >= 7000000;
-. and 
select *from employee where salary>1000000 and age = 10;
->between 
SELECT * FROM  employee WHERE salary between 7000000 and  10000000;




create table sys.studentss (
rollno int not null,
name varchar(45) null,
age varchar(45) null,
city varchar(45) null,
DOB date null,
stream varchar(45) null,
total_marks varchar(45) null,
primary key(rollno));

insert into sys.Student1(rollno,name,age,city,DOB,stream,total_marks) values('1','Vipul','21','Nagpur','20020302','DataScience','987');
insert into sys.Student1(rollno,name,age,city,DOB,stream,total_marks) values('2','Shruti','24','Krakow','19991012','DataEngineer','900');
insert into sys.Student1(rollno,name,age,city,DOB,stream,total_marks) values('3','Asha','39','saonerr','19870917','housewife','800');
insert into sys.Student1(rollno,name,age,city,DOB,stream,total_marks) values('4','Vibhor','16','saoner','20170721','computer science','400');
insert into sys.Student1(rollno,name,age,city,DOB,stream,total_marks) values('5','pranu','28','Katol','19981205','teacher','500');
select*from Student1;
->boolean 
select*from studentss where city='Nagpur';
-.numeric expression (used to perform various mathematical operation
select*from studentss where total_marks/2>=400;
-.for average 
select avg (total_marks) from studentss;
->forn sum
select sum(total_marks) from studentss;






-> Creating database 

create database Vipul;


-. alter table 

alter table studentss add(cars varchar(45) null);



-.rename table 
alter table studentss rename to Student1;

-order by
select *from Student1 order by total_marks;

order by in ascending order 
select *from Student1 order by total_marks asc;

order by in descending order 
select *from Student1 order by total_marks desc;

create table sys.department(
dept_id int not null,
dept_name varchar(45)null,
primary key(dept_id));
insert into sys.department (dept_id,dept_name) values('1','datascience');
insert into sys.department (dept_id,dept_name) values('2','HR');
insert into sys.department (dept_id,dept_name) values('3','teacher');
insert into sys.department (dept_id,dept_name) values('4','sport');
insert into sys.department (dept_id,dept_name) values('5','finance');
insert into sys.department (dept_id,dept_name) values('6','ground staff');
insert into sys.department (dept_id,dept_name) values('7','machine learning');
select * from department;
select * from Student1;

-.retieve the student deatail and the department they are working in 

select rollno,name,stream,dept_id,dept_name from Student1 inner join department on stream=dept_name;


-. outer join
select s.rollno,s.name,p.dept_id,p.dept_name from Student1 s left join department p on rollno=dept_id




union
select s.rollno,s.name,p.dept_id,p.dept_name from Student1 s right join department p on rollno=dept_id

-.upper case function
select ucase(name) from Student1;



-> lower case function 
select name , lcase(name) from Student1;

->Length function in sql 
 select name,length(name) from Student1;



->mid function in sql
select mid(name,2,3) from Student1;

-> roundof
select  round(total_marks,1) from Student1;



select*from vipul.stores
group by
select count(dept_id) as total 




select * from vipul.stores where city= 'Guayaquil' and cluster = 10
select * from Student1 where total_marks <(select avg(total_marks) from Student1);

delimiter $$
CREATE FUNCTION passing_status (
total_marks char(25))
RETURNS VARCHAR(45)
DETERMINISTIC 
BEGIN

	IF total_marks < 600 THEN 
    
	RETURN ('the student is fail');
    
    ELSE
    RETURN('the person is pass ');
END IF;
END$$
delimiter $$
select passing_status(400);
select * from Student1
SELECT rollno, name,total_marks, passing_status(total_marks) from Student1

update Student1 set total_marks=666 where rollno = 6;
commit;


update Student1 set total_marks=666 where rollno = 6; 


Like operator

%percent

select *from Student1 where name like '%r';

Underscore

select *from Student1 where name like '_____';

Trigger  command in sql
drop database triggers;


create database triggers;
use triggers;

# before insert trigger 
create table customer
( cust_id int,age int,name varchar(45));
delimiter //
create trigger age_verify
before insert on customer 
for each row
if new.age<0 then set new.age = 0;
end if; //
insert into customer 
values('101','34','Vipul'),
('111','-34','Vishal'),
('134','35','Vipul');
select * from customer;

#after insert trigger 

create table customers(
id int auto_increment primary key,
name varchar(45) not null ,
email varchar(45),birthdate date);
create table message
(id int auto_increment ,
message_id int,
message varchar(500) not null,
primary key(id,message_id));
delimiter//
create trigger
check_null_dob
after insert 
on customers
for each row
begin
if new.birthdate is null then 
insert into message (message_id,message)
values(new.id,concat('hi',new.name,'please update your data'));
end if ;
customerend //
delimiter ;
insert into customers(name,email,birthdate)
values('Vipul','vipuldhame@mail.vom','1998-06-12'),('Vishasl','vishal@mail.vom',null);
select *from message ;

/*class notes*/
-- WHERE CLAUSE
create database class;
drop table emp1;
use class;
CREATE TABLE Emp1(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  mob int(10),
  Salary int(12)
);
-- Insert some sample data into the Customers table
INSERT INTO Emp1 (EmpID, Name,Country, Age, mob,salary)
VALUES (1, 'Shubham',  'India','23','738479734','1000000'),
       (2, 'Aman ',  'Australia','21','436789555','200000'),
       (3, 'Naveen', 'Austria','24','34873847','300000'),
       (4, 'Aditya',  'Austria','21','328440934','400000'),
       (5, 'Nishant', 'Spain','22','73248679','500000');
       Select * from Emp1;
SELECT * FROM Emp1 WHERE Age=24;
SELECT EmpID, Name, Country,age FROM Emp1 WHERE Age >= 21;
SELECT * FROM Emp1 WHERE Age BETWEEN 22 AND 24;
-- where using like operator
SELECT * FROM Emp1 WHERE Name LIKE '%S';      -- "%" is a wildcard means after S anything
-- To fetch records of Employees where Name contains the pattern ‘M’.
SELECT * FROM Emp1 WHERE Name LIKE '%M';
-- fetch the Names of Employees where Age is 21 or 23.
SELECT Name,age FROM Emp1 WHERE Age IN (21,23);



-- Orderby
use class;
SELECT * FROM Emp1
ORDER BY  Age;

-- DISTINCT 
select distinct Country from Emp1

-- AND operator
Select * FROM emp1 WHERE Country = 'Spain' AND Name LIKE 'N%';

-- OR 
Select * FROM emp1 WHERE Country = 'Spain' OR Name LIKE 'S%';

-- NOT 
SELECT * FROM emp1 WHERE NOT Country = 'Spain';

-- NULL
SELECT *
FROM emp1
WHERE mob IS NULL; 

-- Update
use class
UPDATE emp1
SET Name = 'Vipul ', Country= 'India'
WHERE empid = 1;
select * from emp1
-- nikita is from butibori    Single line Comments
/*nikita is from butibori        Multi line comments
aniiket is from hingna */

-- MINIMUM function
SELECT MIN(Age) FROM emp1;

-- count
SELECT COUNT(*) FROM emp1

-- sum
SELECT SUM(Salary)FROM emp1;

-- avg
SELECT AVG(Salary)FROM emp1;

select * from emp1 where country="australia" and  name like "a%"
select * from emp1 where name "s*" or  country like australia
-- Joinns
use class;
drop table Emp1;
CREATE TABLE Emp1(
Emp1ID INT ,
    Name1 VARCHAR(50) primary key ,
    Country1 VARCHAR(50),
    Age1 int(2),
  mob1 int(10),
  Salary1 int(12)
);
-- Insert some sample data into the Customers table
INSERT INTO Emp1 (Emp1ID, Name1,Country1, Age1, mob1,salary1)
VALUES (1, 'Vipul',  'India','23','738479734','1000000'),
       (1, 'Vipul' ,  'India','23','738479734','1000000'),
       (3, 'Naveen', 'Austria','24','34873847','300000'),
       (4, 'Aditya',  'Austria','21','328440934','400000'),
       (5, 'Nishant', 'Spain','22','73248679','500000');
       Select * from Emp1;
drop table eMP;
CREATE TABLE Emp(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    mob int(10),
  Salary int(12)
);
-- Insert some sample data into the Customers table
INSERT INTO Emp (EmpID, Name,Country, Age, mob,salary)
VALUES (1, 'Vipul',  'UK','1','738479734','3000000'),
       (11, 'Vinit',  'USA','1','738479734','4000000'),
       (2, 'Vishal ',  'Japan','5','436789555','560000'),
       (8, 'Nayan', 'India','24','34873847','700000'),
       (9, 'Aikki',  'India','21','328440934','5600000'),
       (10, 'aniket', 'Japan','24','34873847','1460000'),
       (5, 'mohit', 'India','22','73248679','9800000');
       Select * from Emp;
SELECT Count(EmpID), Country,Sum(salary)
FROM Emp
GROUP BY Country
having sum(salary)>='800000';
select avg(salary) from Emp;
-- Inner Join 
SELECT *
FROM Emp1
INNER JOIN Emp ON Emp1.Emp1ID = Emp.age;

-- Left Join 
SELECT * FROM Emp1
LEFT JOIN Emp ON Emp1.Name1 = Emp.Name;
#ORDER BY Emp1.Name1;

-- Right Join
SELECT * FROM Emp1
RIGHT JOIN Emp ON Emp1.Name1 = Emp.Name;
#ORDER BY Emp1.Name1;

SELECT * FROM Emp1
LEFT JOIN Emp ON Emp1.Name1 = Emp.Name
union
SELECT * FROM Emp1
Right  JOIN Emp ON Emp1.Name1 = Emp.Name ;

create table joins;

-- GroupBy clause-The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns. 
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);
use class;
select sum(salary),Country from Emp group by Country;
select sum(salary) from Emp;
-- Having Clause The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);

SELECT Count(EmpID), Country,Sum(salary)
FROM Emp
GROUP BY Country
having sum(salary)>='800000';

-- The EXISTS operator is used to test for the existence of any record in a subquery.
SELECT Name
FROM Emp
WHERE EXISTS (SELECT Name1 FROM Emp1 WHERE Emp1.Emp1ID = EMp.EmpID AND age= 22);

-- Primary Key:- the PRIMARY KEY constraint uniquely identifies each record in a table.
-- Foreign key
drop table Emp,Emp1;
CREATE TABLE Emp1(
    Emp1ID INT PRIMARY KEY,
    Name VARCHAR(50) unique,
    Country VARCHAR(50) unique,
    Age int(2) unique,
    mob int(10) unique,
  Salary int(12)
 
);
CREATE TABLE Emp(
    EmpID INT ,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
    mob int(10),
  Salary int(12) primary Key,
  FOREIGN KEY (EmpID) REFERENCES Emp1(Emp1ID)
);
