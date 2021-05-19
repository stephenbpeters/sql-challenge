-- SQL home by Stephen Peters stephen.peters@gmail.com
-- May 2021 Data Analytics Bootcamp

-- 1. List the following details of each employee: employee number, last name, 
-- first name, sex, and salary.
select Employee.emp_no, Employee.last_name, Employee.first_name, Employee.sex, joinme.salary
from Employee
JOIN Salaries AS joinme
  ON Employee.emp_no = joinme.emp_no;
  
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date 
	from Employee
where 
(date_part('year', hire_date) = 1986)

-- 3. List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.

-- gives us dept number, employee no, and dept name

create table dept_of_employee as
select dept_manager.dept_no, dept_manager.emp_no, joinme.dept_name
	from dept_manager
	join departments as joinme
	on dept_manager.dept_no = joinme.dept_no;
select * from dept_of_employee

--- and now join our department info with our employee info

select dept_of_employee.dept_no, dept_of_employee.dept_name, 
	dept_of_employee.emp_no, joinme.first_name, joinme.last_name
	from dept_of_employee
	join employee as joinme
	on dept_of_employee.emp_no = joinme.emp_no