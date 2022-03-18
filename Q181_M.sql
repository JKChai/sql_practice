/*
181. Employee Earnings More than their Manager

Write an SQL query to find the employees who earn more than their managers.

Return the result table in any order.
*/

--@block RUN QUERY

WITH CTE AS (
    SELECT a.id, a.name as Employee, 
    a.salary, a.managerId, 
    b.name as manager, b.salary as manSalary
    FROM employee_input1_181 as a
    INNER JOIN employee_input1_181 as b
    ON a.managerId = b.id)

SELECT Employee
FROM CTE
WHERE salary > manSalary;

/*
## SOLUTIONS PROVIDED FROM LEETCODE
------------------------------------
## NOT THE BEST - USING WHERE CLAUSE 
SELECT
    a.Name AS 'Employee'
FROM
    Employee AS a,
    Employee AS b
WHERE
    a.ManagerId = b.Id
        AND a.Salary > b.Salary
;

#####################################
## BEST - USING JOIN CLAUSE
SELECT
     a.NAME AS Employee
FROM Employee AS a JOIN Employee AS b
     ON a.ManagerId = b.Id
     AND a.Salary > b.Salary
;
*/