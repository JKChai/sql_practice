/*
184. Department Highest Salary
Medium

Write an SQL query to find employees who have the highest salary in each of the departments.

Return the result table in any order.
*/

--@block
WITH CTE as (
    SELECT departmentId, MAX(salary) as Max_Salary, d.name
    FROM employee_input1_184 as e
    LEFT JOIN department_input1_184 as d
    ON e.departmentId = d.id
    GROUP BY d.name)

SELECT a.name as Department, e.name as Employee, salary
FROM employee_input1_184 as e
LEFT JOIN CTE as a
ON e.departmentId = a.departmentId
WHERE salary = Max_Salary;

