-- Priviliges needed to be granted before the making connection
-- CREATE USER 'user_name'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
-- GRANT ALL PRIVILEGES ON *.* TO 'user_name'@'%';
-- FLUSH PRIVILEGES;
-- https://dev.mysql.com/doc/refman/8.0/en/creating-accounts.html

--@block
-- preview database 
SHOW DATABASES;

--@block
SHOW TABLES;

--@block 
-- create a quick table for database
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(20) NOT NULL,
    major VARCHAR(20)
);

--@block
DESCRIBE student;

-- Table can be DROP
-- DROP TABLE student;
-- TABLE can be ALTER
-- ALTER TABLE student ADD gpa DECIMAL(3,2);
-- TABLE column can be dropped
-- ALTER TABLE student DROP COLUMN gpa;

--@block
INSERT INTO student (student_name, major) 
VALUES 
(
    'Jack', 'Biology'
),
(
    'Kate', 'Sociology'
),
(
    'James', 'Chemistry'
),
(
    'Russ', 'Biology'
),
(
    'Mike', 'Computer Science'
);

--@block
-- update column value
UPDATE student
SET major = 'Comp Sci'
WHERE major = 'Computer Science';

DELETE FROM student
WHERE student_name = 'James' AND major = 'chemistry';

--@BLOCK
SELECT * 
FROM student
ORDER BY student_id DESC
LIMIT 2;

--@block
DROP TABLE student;

--@block
SELECT concat('DROP TABLE IF EXISTS `', table_name, '`;')
FROM information_schema.tables
WHERE table_schema = 'local_test_db';

--@block
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE branch;
DROP TABLE branch_supplier;
DROP TABLE client;
DROP TABLE employee;
DROP TABLE works_with;
-- Your semicolon separated list of DROP statements here
SET FOREIGN_KEY_CHECKS = 1;

--@block
-- RUN TABLES
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

--@block
CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

--@block -- ADD Foreign key after table created

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

--@block
CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

--@block
CREATE TABLE works_with (
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id),
    FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

--@block
CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


--@block
DESCRIBE branch;

--@block
DESCRIBE branch_supplier;

--@block
DESCRIBE client;

--@block
DESCRIBE employee;

--@block
DESCRIBE works_with;

--@block
-- Has to insert data in this specific order
-- Foreign Key is a primary key of table that is not created
-- hence, setting null first and update when that table is created
-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

--@block
-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

--@block
-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

--@block
-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

--@block
-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

--@block
-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

--@block -- Check if data EXISTS
SELECT * FROM works_with;

--@block --Observe different SEX
SELECT DISTINCT sex
FROM employee;

--@block --Run SQL functions
SELECT COUNT(emp_id)
FROM employee
WHERE sex='F' AND birth_day > '1971-01-01';

--@block --Another SQL functions
SELECT sex, COUNT(emp_id)
FROM employee
WHERE birth_day > '1971-01-01'
GROUP BY sex;

--@block --perform wildcards

