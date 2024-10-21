CREATE TABLE "Departments" (
    dept_no VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE "Titles" (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

CREATE TABLE "Employees" (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(10),
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES "Titles" (title_id)
);

CREATE TABLE "Salaries" (
    emp_no INT,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary),  
    FOREIGN KEY (emp_no) REFERENCES "Employees" (emp_no)
);

CREATE TABLE "Department_Employee" (
    emp_no INT,
    dept_no VARCHAR(10),
    PRIMARY KEY (emp_no, dept_no),  
    FOREIGN KEY (emp_no) REFERENCES "Employees" (emp_no),
    FOREIGN KEY (dept_no) REFERENCES "Departments" (dept_no)
);

CREATE TABLE "Department_Manager" (
    dept_no VARCHAR(30),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no), 
    FOREIGN KEY (dept_no) REFERENCES "Departments" (dept_no),
    FOREIGN KEY (emp_no) REFERENCES "Employees" (emp_no)
);