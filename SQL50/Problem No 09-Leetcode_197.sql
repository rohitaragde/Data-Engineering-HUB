----------------------------------- Leetcode 197 ---------------------------------

-------------------------------- Rising Temprature --------------------------------

Question:-
 
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).


 Solution:-

 
create table Weather
(id int primary key,
 recordDate date,
 temprature int);

 insert into Weather values(1,'2015-01-01',10);
 insert into Weather values(2,'2015-01-02',25);
 insert into Weather values(3,'2015-01-03',20);
 insert into Weather values(4,'2015-01-04',30);

 select * from Weather;

 /*
 Write a solution to find all dates' 
 Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
*/

 select * from Weather;

SELECT a.id as id FROM Weather a JOIN Weather b 
ON DATEDIFF(day, b.recordDate, a.recordDate) = 1
WHERE a.temprature > b.temprature;
