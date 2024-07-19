--1. List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
join salaries s on s.emp_no = e.emp_no

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where date_part('year', hire_date) = '1986'
order by hire_date

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
select e.first_name, e.last_name, e.emp_no, dm.dept_no, d.dept_name
from employees e
join dept_manager dm on dm.emp_no = e.emp_no
join departments d on d.dept_no = dm.dept_no

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
inner join dept_emp de on de.emp_no = e.emp_no
inner join departments d on d.dept_no = de.dept_no
order by emp_no

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--6. List each employee in the Sales department, including their employee number, last name, and first name.
select d.dept_name, e.emp_no, e.last_name, e.first_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where dept_name = 'Sales'
order by emp_no

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select d.dept_name, e.emp_no, e.last_name, e.first_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where dept_name in ('Sales', 'Development')
order by emp_no

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as count_of_last_name
from employees
group by last_name
order by count(last_name) desc


