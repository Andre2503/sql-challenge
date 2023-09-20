--create title table 
DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY,
	title_name VARCHAR (30)
);

-- view 
SELECT *
FROM titles;

--create employees table 
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	title_id VARCHAR (10),
	FOREIGN KEY (title_id) REFERENCES titles(title_id), 
	birth_date DATE,
	first_name VARCHAR, 
	last_name VARCHAR,
	sex VARCHAR (1),
	hire_date DATE
);

-- view 

SELECT *
FROM employees

--create departments table
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	dept_id VARCHAR (50) PRIMARY KEY,
	dept_name VARCHAR
);

--view departments table 
SELECT *
FROM departments;

--create department_employee table 
DROP TABLE IF EXISTS dept_employee
CREATE TABLE dept_employee (
	employee_id INT,
	dept_id VARCHAR (15),
	PRIMARY KEY (employee_id, dept_id)
);

--view dept_employee 
SELECT *
FROM dept_employee; 

--create department menager table 
DROP TABLE ID EXISTS dept_manager
CREATE TABLE dept_manager (
	dept_id VARCHAR (50),
	employee_id INT,
	FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
	PRIMARY KEY (dept_id, employee_id)	
);

-- view newly created table --dept_manager
SELECT *
FROM dept_manager

--create salary table 
DROP TABLE IF EXISTS salary
CREATE TABLE salary (
	employee_id INT, 
	salary INT NOT NULL, 
	FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
	PRIMARY KEY (employee_id)
);

---view salary 
SELECT * 
FROM salary

--DATA ANALYSIS 

--List the employee number, last name, first name, sex, 
--and salary of each employee.

SELECT e.employee_id, e.last_name, e.first_name, 
e.sex, s.salary
FROM employees e
LEFT JOIN salary s 
ON s.employee_id = e.employee_id; 

-- List the first name, last name, and hire date 
--for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name

SELECT e.first_name, e.last_name, 
d.dept_id, d.employee_id, de.dept_name
FROM employees e
RIGHT JOIN dept_manager d ON d.employee_id = e.employee_id
RIGHT JOIN departments de ON de.dept_id = d.dept_id;

--List the department number for each employee along with that 
--employee’s employee number, last name, first name, and department name

SELECT de.dept_id, de.employee_id, 
d.dept_name, e.last_name, e.first_name
FROM dept_employee de
LEFT JOIN departments d ON d.dept_id = de.dept_id
LEFT JOIN employees e ON e.employee_id = de.employee_id;

--List the first name, last name, and sex of each employee whose 
--first name is Hercules and whose last name begins with the letter B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their 
--employee number, last name, and first name.

SELECT last_name, first_name
FROM employees 
WHERE employee_id IN (
	SELECT employee_id
	FROM dept_employee
	WHERE dept_id = (
		SELECT dept_id
		FROM departments 
		WHERE dept_name = 'Sales'
));

--List each employee in the Sales and Development departments, 
--including their employee number, last name, 
--first name, and department name.

SELECT e.employee_id, e.last_name, e.first_name, de.dept_name
FROM employees e
LEFT JOIN dept_employee d ON d.employee_id = e.employee_id
LEFT JOIN departments de ON de.dept_id = d.dept_id
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--using sub query -- this is courtesy of GPT4 cause I could not 
--for the life of me figure out how to do it using subqueries, and I 
--still think my option above is much more elegant :-) 

SELECT e.employee_id, e.last_name, e.first_name,
       (SELECT de.dept_name FROM departments de WHERE de.dept_id = d.dept_id) AS dept_name
FROM employees e
LEFT JOIN dept_employee d ON e.employee_id = d.employee_id
WHERE d.dept_id IN (
    SELECT de.dept_id FROM departments de WHERE de.dept_name = 'Sales' OR de.dept_name = 'Development'
);

--List the frequency counts, in descending order, 
--of all the employee last names 
--(that is, how many employees share each last name).	

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name 
ORDER BY UPPER(last_name) DESC






