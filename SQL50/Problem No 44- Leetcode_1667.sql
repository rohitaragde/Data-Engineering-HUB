----------------------------- Leetcode 1667-------------------------------------
----------------------------- Fix Names in a Table-----------------------------
Question:-
 
Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.
 

Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

The result format is in the following example.

 

Example 1:

Input: 
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+

Solution:-
 
use rohit;

create table Users16
(users_id int primary key,
 nname varchar(10));

 insert into Users16 values(1,'alice');
 insert into Users16 values(2,'boB');

 select * from Users16;

/* Write a solution to fix the names so that only the first character
 is uppercase and the rest are lowercase.
Return the result table ordered by user_id.*/

SQL Server:-

select users_id,
Upper(SUBSTRING(nname,1,1))+ lower(SUBSTRING(nname,2,len(nname)-1)) as name
from Users16;

MySQL:-
 
select users_id,
concat(Upper(SUBSTRING(nname,1,1)),lower(SUBSTRING(nname,2))) as name
from Users16;





