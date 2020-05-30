-- List the following details of each employee: 
-- employee number, last name, first name, gender, and salary.

SELECT emp_no, last_name, first_name, gender, salary
FROM joined_table
;

-- List employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM joined_table 
WHERE hire_date LIKE '1986%'
;

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.

SELECT dept_no, dept_name, emp_no, last_name, first_name, from_date, to_date
FROM joined_table
WHERE title = 'Manager'
;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM joined_table
;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT last_name, first_name
FROM joined_table
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM joined_table
WHERE dept_name = 'Sales'
;

-- List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM joined_table
WHERE dept_name = 'Sales' OR dept_name = 'Development'
;

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM joined_table
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;
