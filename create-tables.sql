-- SQL homework by Stephen Peters stephen.peters@gmail.com
-- May 2021 Data Analytics Bootcamp
-- creating tables...

drop table if exists Titles;
CREATE TABLE Titles (
    title_id varchar(10) primary key NOT NULL,
    title varchar(30) NOT NULL
);
select * from Titles;

drop table if exists Employee;
CREATE TABLE Employee (
    emp_no int primary key,
	emp_title varchar(10) not null,
	foreign key (emp_title) references Titles(title_id),
    birth_date date NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    sex varchar(1) NOT NULL,
    hire_date date NOT NULL
);
select * from Employee;	

drop table if exists salaries;
CREATE TABLE Salaries (
    emp_no int NOT NULL primary key,
	foreign key (emp_no) references Employee(emp_no),
    salary int NOT NULL 
);
select * from Salaries;

drop table if exists Departments;
create table Departments (
	dept_no varchar(10) not null primary key,
	dept_name varchar(30) not null
);
select * from Departments;

drop table if exists Dept_manager;
create table Dept_manager (
	dept_no varchar(10) not null,
	emp_no int not null primary key,
	foreign key (emp_no) references Employee(emp_no),
	foreign key (dept_no) references Departments(dept_no)
);
select * from Dept_manager;

drop table if exists Dept_emp;
create table Dept_emp (
	emp_no int not null,
	dept_no varchar(10) not null,
	foreign key (emp_no) references Employee(emp_no),
	foreign key (dept_no) references Departments(dept_no),
	primary key (emp_no, dept_no)
);
select * from Dept_emp;	