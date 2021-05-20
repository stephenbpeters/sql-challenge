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

create table dept_of_mgr as
select dept_manager.dept_no, dept_manager.emp_no, joinme.dept_name
	from dept_manager
	join departments as joinme
	on dept_manager.dept_no = joinme.dept_no;
select * from dept_of_mgr;

--- and now join our department info with our employee info

select dept_of_mgr.dept_no, dept_of_mgr.dept_name, 
	dept_of_mgr.emp_no, joinme.first_name, joinme.last_name
	from dept_of_mgr
	join employee as joinme
	on dept_of_mgr.emp_no = joinme.emp_no
	
-- 4. List the department of each employee with the following information: 
--	employee number, last name, first name, and department name.
-- first connect employee to dept no
create table dept_of_employee as
select employee.emp_no, employee.last_name, employee.first_name, joinme.dept_no 
	from employee
	join dept_emp as joinme
	on employee.emp_no = joinme.emp_no;
select * from dept_of_employee;
-- now connect dept no to dept name.
select dept_of_employee.emp_no, dept_of_employee.last_name, dept_of_employee.first_name,
	joinme.dept_name
	from dept_of_employee
	join departments as joinme
	on dept_of_employee.dept_no = joinme.dept_no;
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules"
-- and last names begin with "B."	

select first_name, last_name, sex from employee
	where first_name = 'Hercules' and last_name like 'B%';
	
-- 6. List all employees in the Sales department, including their employee number,
--    last name, first name, and department name.	
-- this will give us all the employees in the sales department, which is dep_no 'd007'
create table sales_dept as
	select * from dept_of_employee
	where dept_no = 'd007';
select * from sales_dept;

-- By definition, we already know the department of the employees in the sales department
-- but since it's been requested, here you go:
select sales_dept.emp_no, sales_dept.last_name, sales_dept.first_name,
	joinme.dept_name
	from sales_dept
	join departments as joinme
	on sales_dept.dept_no = joinme.dept_no;
	
-- 7. List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.	

-- get employees from those two departments.	
create table sales_and_dev_depts as
	select * from dept_of_employee
	where dept_no = 'd007' or dept_no = 'd005';
select * from sales_and_dev_depts;

-- now connect dept no to dept name.
select sales_and_dev_depts.emp_no, sales_and_dev_depts.last_name, sales_and_dev_depts.first_name,
	joinme.dept_name
	from sales_and_dev_depts
	join departments as joinme
	on sales_and_dev_depts.dept_no = joinme.dept_no;
	
-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	