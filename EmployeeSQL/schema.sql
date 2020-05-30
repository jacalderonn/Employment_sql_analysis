-- Creating tables
CREATE TABLE departments (
    dept_no VARCHAR(20) NOT NULL,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(20) NOT NULL,
    from_date VARCHAR(20) NOT NULL,
    to_date VARCHAR(20) NOT NULL,
    FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(20) NOT NULL,
    emp_no INT NOT NULL,
    from_date VARCHAR(20) NOT NULL,
    to_date VARCHAR(20) NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES dept_emp(emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(emp_no) REFERENCES titles(emp_no)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    birth_date VARCHAR(20) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender VARCHAR(2) NOT NULL,
    hire_date VARCHAR(20) NOT NULL
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date VARCHAR(30) NOT NULL,
    to_date VARCHAR(30) NOT NULL
);

CREATE TABLE titles (
    emp_no INT NOT NULL,
    title VARCHAR(30) NOT NULL,
    from_date VARCHAR(20) NOT NULL,
    to_date VARCHAR(20) NOT NULL
);

-- Joinnig tables
CREATE VIEW joined_table AS
SELECT A.dept_name, A.dept_no, B.from_date, B.to_date, D.salary, E.title, 
F.emp_no, F.birth_date, F.first_name, F.last_name, F.gender, F.hire_date
FROM departments AS A
LEFT JOIN dept_emp AS B ON A.dept_no = B.dept_no
LEFT JOIN dept_manager AS C ON B.dept_no = C.dept_no
LEFT JOIN salaries AS D ON C.emp_no = D.emp_no
LEFT JOIN titles AS E ON D.emp_no = E.emp_no
LEFT JOIN employees AS F ON E.emp_no = F.emp_no
;

