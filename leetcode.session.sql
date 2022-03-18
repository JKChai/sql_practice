/*
181 Employee Earnings More than their Manager
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


