/*
175. Combine Two Tables

Write an SQL query to report the first name, 
last name, city, and state of each person 
in the Person table. If the address of a personId 
is not present in the Address table, report null instead.

Return the result table in any order.
*/

--@block
select firstName, lastName, city, state
FROM person_input1_175 as p
LEFT JOIN address_input1_175 as a
ON p.personId = a.personId

