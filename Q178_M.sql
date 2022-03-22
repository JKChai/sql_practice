/*
178. Rank Scores

Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:

* The scores should be ranked from the highest to the lowest.
* If there is a tie between two scores, both should have the same ranking.
* After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.

Return the result table ordered by score in descending order.

The query result format is in the following example.
*/

--@block
SELECT score, 
DENSE_RANK() OVER(ORDER BY score DESC) as "Rank"
FROM Scores_input1_178;

--@block
SELECT scores.score, x.rank
FROM Scores_input1_178 as scores,
    (SELECT DISTINCT score, 
     DENSE_RANK() OVER(ORDER BY score DESC) as "Rank"
     FROM Scores_input1_178) as x
WHERE scores.score = x.score
ORDER BY x.rank ASC;