CREATE DATABASE school;
USE school;
-- Showing One to Many relationship
CREATE TABLE student_records(
id INT PRIMARY KEY AUTO_INCREMENT,
fullName VARCHAR(100),
age INT,
fee_balance INT UNIQUE,
department VARCHAR (255),
unit VARCHAR (100)
);
-- Insert values into student_records
INSERT INTO student_records(id, fullName, age, fee_balance, department, unit) VALUES
(1, "Mary Nduku", 20, 0, "English", "Linguistics"),
(2, "John Wekesa", 24, 2500, "Science", "Chemistry"),
(3, "Samson Mwangi", 19, 6400, "Geography", "Geospatial"),
(4, "Sophia Wanza", 23, 1200, "Home Science", "Economics"),
(5, "Micahel Jones", 21, 2300, "Mathematics", "Calculus"),
(6, "Esther Mukami", 26, 850, "Agriculture", "Soil Science"),
(7, "Omari Mohammed", 20, 300, "Social Studies", "Governance"),
(8, "Rehema Wakesho", 22, 700, "Arts", "Crafts"),
(9, "Gregory Isaacs", 27, 5600, "Kiswahili", "Tamthilia"),
(10, "Tataiana Ali", 18, 600, "History", "Industralization");

SELECT * FROM student_records;

UPDATE student_records
SET age = 25
WHERE id = 2;

-- Showing One to Many relationship
CREATE TABLE fee_record(
    studentId INT PRIMARY KEY,
    departmentName VARCHAR(100),
    fee_balance INT,
    age INT,
    FOREIGN KEY (studentId) REFERENCES student_records(id)
);
-- Inserting values to fee_record
INSERT INTO fee_record(studentId, age, fee_balance, departmentName) VALUES
(1, 20, 0, "English"),
(2, 24, 2500, "Science"),
(3, 19, 6400, "Geography"),
(4, 23, 1200, "Home Science"),
(5, 21, 2300, "Mathematics"),
(6, 26, 850, "Agriculture"),
(7, 20, 300, "Social Studies"),
(8, 22, 700, "Arts"),
(9, 27, 5600, "Kiswahili"),
(10, 18, 600, "History");
-- Verification of creation and insertion of values into fee_record
SELECT * FROM fee_record;

-- Showing One to Many relationship
CREATE TABLE employees(
employeeid INT PRIMARY KEY AUTO_INCREMENT,
fullname VARCHAR(100),
age INT NOT NULL,
department VARCHAR(255),
department_id INT
);
-- Inserting values into employees table
INSERT INTO employees(employeeid, fullname, age, department, department_id) VALUES
(101, "Moses Kiragu", 30, "Science", 1),
(102, "Kingston Shiundu", 40, "Geography", 2),
(103, "Sally Owen", 25, "English", 3),
(104, "Samia Suluhu", 45, "Kiswahili", 4),
(105, "William Kipchirchir", 40, "Agriculture", 5),
(106, "Olivia Mutuku", 32, "Social_Studies", 6),
(107, "Gerald Owino", 35, "Mathematics", 7),
(108, "Amina Mohammed", 42, "Arts", 8),
(109, "Musa Kombo", 29, "History", 9),
(110, "Alicia Atieno", 35, "Home Science", 10);

-- Verification of employees table existence
SELECT * FROM employees;

-- Showing One to One relationship
CREATE TABLE department(
department_id INT PRIMARY KEY AUTO_INCREMENT,
departmentName VARCHAR (255),
employeeid INT,
FOREIGN KEY (employeeid) REFERENCES employees(employeeid)
);
-- Inserting values into department table
INSERT INTO department(department_id, departmentName, employeeid) VALUES
(1, "Science", 101),
(2, "Geography", 102),
(3, "English", 103),
(4, "Kiswahili", 104),
(5, "Agriculture", 105),
(6, "Social_Studies", 106),
(7, "Mathematics", 107),
(8, "Arts", 108),
(9, "History", 109),
(10, "Home Science", 110);

-- Verification of department table existence
SELECT * FROM department;

 -- Showing Many to Many relationship
-- Junction table for students and units
CREATE TABLE student_units (
    student_id INT,
    unit VARCHAR(100),
    PRIMARY KEY (student_id, unit),
    FOREIGN KEY (student_id) REFERENCES student_records(id)
);
-- Insert values into student_units
INSERT INTO student_units(student_id, unit) VALUES
(1, "Linguistics"),
(2, "Chemistry"),
(3, "Geospatial"),
(4, "Economics"),
(5, "Calculus"),
(6, "Soil Science"),
(7, "Governance"),
(8, "Crafts"),
(9, "Tamthilia"),
(10, "Industralization");

-- Showing Many to Many relationship
-- Junction table for employees and departments
CREATE TABLE employee_departments (
    employeeid INT,
    department_id INT,
    PRIMARY KEY (employeeid, department_id),
    FOREIGN KEY (employeeid) REFERENCES employees(employeeid),
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);
-- Insert values into employee_departments
INSERT INTO employee_departments(employeeid, department_id) VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5),
(106, 6),
(107, 7),
(108, 8),
(109, 9),
(110, 10);

