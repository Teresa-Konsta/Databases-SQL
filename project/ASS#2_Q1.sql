CREATE TABLE Regions
(region_id number(10) PRIMARY KEY,
region_name varchar2(25) UNIQUE
)

CREATE TABLE Countries
(country_id char(2) PRIMARY KEY,
countrty_name varchar2(40) UNIQUE,
region_id number(10),
CONSTRAINT reg_fk FOREIGN KEY (region_id)
REFERENCES Regions (region_id)
)

CREATE TABLE Locations
(location_id number(10) PRIMARY KEY,
street_address VARCHAR2(25),
postal_code VARCHAR2(12),
city VARCHAR2(30) UNIQUE,
state_province VARCHAR2(12) UNIQUE,
country_id char(2),
CONSTRAINT count_fk FOREIGN KEY (country_id)
REFERENCES Countries (country_id)
)

CREATE TABLE Departments
(department_id number(8) PRIMARY KEY,
department_name VARCHAR2(30) UNIQUE,
manager_id number(8) UNIQUE NOT NULL,
location_id number(10),
CONSTRAINT loc_fk FOREIGN KEY (location_id)
REFERENCES Locations (location_id)
)

CREATE TABLE Jobs
(job_id varchar2(10) PRIMARY KEY,
job_title varchar2(35) NOT NULL,
min_salary number(10) NOT NULL,
max_salary number(10) NOT NULL
)

CREATE TABLE Job_history
(employee_id number(8),
start_date DATE DEFAULT SYSDATE,
end_date DATE,
job_id varchar2(10),
department_id number(8),
PRIMARY KEY (employee_id, start_date),
CONSTRAINT job_fk FOREIGN KEY (job_id)
REFERENCES Jobs (job_id),
CONSTRAINT dep_fk FOREIGN KEY (department_id)
REFERENCES Departments (department_id)
)

CREATE TABLE Employees
(employee_id number(8) PRIMARY KEY,
first_name varchar2(20) NOT NULL,
last_name varchar2(25) NOT NULL,
email varchar2(25) UNIQUE NOT NULL,
phone_number varchar2(20) UNIQUE NOT NULL,
hire_dste DATE DEFAULT SYSDATE,
job_id varchar2(10),
salary number(10, 2) CHECK (salary > 1000),
commission_pct number(10) UNIQUE,
manager_id number(8) UNIQUE NOT NULL,
department_id number(8),
CONSTRAINT emp_fk FOREIGN KEY (employee_id)
REFERENCES Job_history (employee_id),
CONSTRAINT jb_fk FOREIGN KEY (job_id)
REFERENCES Jobs (job_id),
CONSTRAINT dp_fk FOREIGN KEY (department_id)
REFERENCES Departments (department_id)
)

CREATE TABLE Job_grades
(grade_level varchar2(2) PRIMARY KEY,
lowest_salary number(10) NOT NULL,
highest_salary number(10) NOT NULL
)

INSERT INTO Regions
VALUES (1, 'North America')

INSERT INTO Regions
VALUES (2, 'Europe')