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


