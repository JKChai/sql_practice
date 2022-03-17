/* 
177. Nth Highest Salary

Write an SQL query to report the nth highest salary 
from the Employee table. If there is no 
nth highest salary, the query should report null.

*/

--@block my solution
/* 
Use the same logic as Q 166
but the offset needed to be decremented by 1
this is done by declaring new variables & set with new value

Notice that an error will be thrown if DETERMINISTIC KEY word does not exist;
https://dev.mysql.com/doc/refman/8.0/en/stored-programs-logging.html
*/
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
DETERMINISTIC
BEGIN
DECLARE M INT DEFAULT 0;
SET M = N-1;

  RETURN (
      # Write your MySQL query statement below.
      SELECT IFNULL((
        SELECT DISTINCT salary
        FROM employee2
        ORDER BY salary DESC
        LIMIT 1 OFFSET M), NULL) as S
  );
END;

--@block show all functions available
SHOW FUNCTION STATUS;

--@block Assess function properties
SHOW CREATE FUNCTION getNthHighestSalary;

--@block drop function by rewriting new ONE
DROP FUNCTION IF EXISTS leetcode_db.getNthHighestSalary;

--@block
SELECT getNthHighestSalary(2);

