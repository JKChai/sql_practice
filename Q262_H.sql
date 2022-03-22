/*
262. Trips & Users

The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Write a SQL query to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

Return the result table in any order.

The query result format is in the following example.
*/

--@block

SELECT
t.request_at as "Day",
ROUND(
    COUNT(
        CASE 
        WHEN t.status 
        IN ( 'cancelled_by_driver', 'cancelled_by_client') 
        THEN t.id 
        ELSE NULL END)/COUNT(t.id), 2) as "Cancellation Rate"
FROM Trips_input1_262 as t
INNER JOIN Users_input1_262 as u1 
ON t.client_id = u1.user_id AND u1.role='client' AND u1.banned='No'
INNER JOIN Users_input1_262 as u2 
ON t.driver_id = u2.user_id AND u2.role='driver' AND u2.banned='No'
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.request_at

--@block

select Day,
round(cancellations/total_trips,2) as 'Cancellation Rate'
from (
select
request_at as Day,
sum(CASE 
WHEN status 
IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 
ELSE 0 END) as cancellations,
count(*) as total_trips
from Trips_input1_262 as trips
INNER join Users_input1_262 AS users 
ON Trips.client_id = users.user_id and users.banned = 'No'
group by request_at
) s;