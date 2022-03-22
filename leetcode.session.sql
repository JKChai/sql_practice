/*
178 Rank Scores
*/

--@block 
CREATE TABLE scores_input1_178 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    score DECIMAL(4,2)
);

--@block 
INSERT INTO scores_input1_178 (score)
VALUES
(3.50),
(3.65),
(4.00),
(3.85),
(4.00),
(3.65);

/*
262 Trips & Users
*/

--@block Create employee TABLE
CREATE TABLE trips_input1_262 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    driver_id INT,
    city_id INT,
    status ENUM('completed', 'cancelled_by_driver', 'cancelled_by_client'),
    request_at DATE
);

--@block Create employee TABLE
CREATE TABLE users_input1_262 (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    banned ENUM('client', 'driver', 'partner'),
    role ENUM('Yes', 'No')
);

--@block Add foreign key
ALTER TABLE trips_input1_262
ADD FOREIGN KEY(client_id)
REFERENCES users_input1_262(user_id)
ON DELETE SET NULL;

ALTER TABLE trips_input1_262
ADD FOREIGN KEY(driver_id)
REFERENCES users_input1_262(user_id)
ON DELETE SET NULL;

--@block
/*Remove auto increment from user_id*/
SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE users_input1_262 MODIFY COLUMN user_id INT;

SET FOREIGN_KEY_CHECKS=1;


--@block
/* Drop foreign key constraints */

/* ALTER TABLE tbl_name DROP FOREIGN KEY fk_symbol; */


--@block
/*
Rename data column and give data type
*/
/*ALTER TABLE users_input1_262 CHANGE banned role ENUM('Yes', 'No'); */

--@block
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE users_input1_262;
SET FOREIGN_KEY_CHECKS = 1;

--@block Create employee TABLE
CREATE TABLE users_input1_262 (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    banned ENUM('Yes', 'No'),
    role ENUM('client', 'driver', 'partner')
);

--@block
/*
https://stackoverflow.com/questions/64366488/how-to-handle-a-foreign-key-constraint-fails-in-mysql
Order does matter
*/
INSERT INTO users_input1_262 (user_id, banned, role) 
VALUES 
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

INSERT INTO trips_input1_262 (client_id, driver_id, city_id, status, request_at) 
VALUES 
(1, 10, 1, 'completed', '2013-10-01'),
(2, 11, 1, 'cancelled_by_driver', '2013-10-01'),
(3, 12, 6, 'completed', '2013-10-01'),
(4, 13, 6, 'cancelled_by_client', '2013-10-01'),
(1, 10, 1, 'completed', '2013-10-02'),
(2, 11, 6, 'completed', '2013-10-02'),
(3, 12, 6, 'completed', '2013-10-02'),
(2, 12, 12, 'completed', '2013-10-03'),
(3, 10, 12, 'completed', '2013-10-03'),
(4, 13, 12, 'cancelled_by_driver', '2013-10-03');


/*
184. Department Highest Salary
*/
--@block Create employee TABLE
CREATE TABLE employee_input1_184 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40),
    salary INT,
    departmentId INT
);

--@block Create department TABLE
CREATE TABLE department_input1_184 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40)
);

--@block 
INSERT INTO employee_input1_184 (name, salary, departmentId) 
VALUES 
('Joe', 70000, 1),
('Jim', 90000, 1),
('Henry', 80000, 2),
('Sam', 60000, 2),
('Max', 90000, 1);

INSERT INTO department_input1_184 (name) 
VALUES 
('IT'),
('Sales');

/*
175. Combine Two Tables
*/
--@block Create person TABLE
CREATE TABLE person_input1_175 (
    personId INT PRIMARY KEY AUTO_INCREMENT,
    lastName VARCHAR(40),
    firstName VARCHAR(40)
);

CREATE TABLE address_input1_175 (
    addressId INT PRIMARY KEY AUTO_INCREMENT,
    personId int,
    city VARCHAR(40),
    state VARCHAR(40)
);
--@block Insert values
INSERT INTO person_input1_175 (lastName, firstName) 
VALUES 
('Wang', 'Allen'),
('Alice', 'Bob');

INSERT INTO address_input1_175 (personId, city, state) 
VALUES 
(2, 'New York City', 'New York'),
(3, 'Leetcode', 'California');

/*
##############################################
181. Employee Earnings More than their Manager
##############################################
*/

--@block Create input 1 TABLE
CREATE TABLE employee_input1_181 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40),
    salary INT,
    managerId INT
);

--@block Insert values
INSERT INTO employee_input1_181 (name, salary, managerId) 
VALUES 
('Joe', 70000, 3),
('Henry', 80000, 4),
('Sam', 60000, NULL),
('Max', 90000, NULL);


/*
mysql> DESCRIBE leetcode_db.employee_input1_181;
+-----------+-------------+------+-----+---------+----------------+
| Field     | Type        | Null | Key | Default | Extra          |
+-----------+-------------+------+-----+---------+----------------+
| id        | int         | NO   | PRI | NULL    | auto_increment |
| name      | varchar(40) | YES  |     | NULL    |                |
| salary    | int         | YES  |     | NULL    |                |
| managerId | int         | YES  |     | NULL    |                |
+-----------+-------------+------+-----+---------+----------------+

mysql> SELECT * FROM leetcode_db.employee_input1_181;
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
|  1 | Joe   |  70000 |         3 |
|  2 | Henry |  80000 |         4 |
|  3 | Sam   |  60000 |      NULL |
|  4 | Max   |  90000 |      NULL |
+----+-------+--------+-----------+
4 rows in set (0.00 sec)

*/

/*------------------------------------------------------------------------------*/

/*
176. Second Highest Salary
177 Nth-Highest Salary
*/

--@block Create input 1 TABLE
CREATE TABLE employee1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    salary INT
);

--@block Create input 2 TABLE
CREATE TABLE employee2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    salary INT
);

--@block show tables
SHOW TABLES;

--@block
INSERT INTO employee1 (salary) 
VALUES 
(100),
(200),
(300);

--@block
INSERT INTO employee2 (salary) 
VALUES 
(100);

--@block
DELETE FROM employee2 WHERE `id` = 2;


