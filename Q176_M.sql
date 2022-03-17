/*
176 Second Highest Salary

Report Second Highest Salary
*/

--@block my solution
/*
Using RANK to give rank based on salary ordered
Select the 2nd rank & uses IFNULL to return null
*/

SELECT IFNULL(
(SELECT salary
 FROM (
    SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) as rank_n
    FROM employee2
       ) as s
 WHERE rank_n = 2), NULL) as SecondHighestSalary;

--@block Solution1
/*
Straightforward by using OFFSET keyword on LIMIT clause
this select the second highest salary after being sorted
LIMIT by default return NULL if the value doesn't exist
Process --> FROM - SELECT - ORDER BY - LIMIT - SELECT
*/

SELECT
    (SELECT DISTINCT
            salary
        FROM
            employee2
        ORDER BY Salary DESC
        LIMIT 1 OFFSET 1) AS SecondHighestSalary
;

--@block Solution2
/*
Using IFNULL keyword to explicitly return NULL
Process is exactly the same as solution 1
*/
SELECT
    IFNULL(
      (SELECT DISTINCT Salary
       FROM Employee
       ORDER BY Salary DESC
        LIMIT 1 OFFSET 1),
    NULL) AS SecondHighestSalary