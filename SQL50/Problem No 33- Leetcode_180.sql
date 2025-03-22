-------------------------------- Leetcode 180---------------------------------

Question:-

Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.
 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.

Solution:-

create table LLogs
(id int identity(1,1) primary key,
 num varchar(10));

 insert into LLogs values(1);
 insert into LLogs values(1);
  insert into LLogs values(1);
 insert into LLogs values(2);
 insert into LLogs values(1);
 insert into LLogs values(2);
 insert into LLogs values(2);

 select * from LLogs;

 select a.num as ConsecutiveNums from llogs a join llogs b
 on a.id=b.id+1 and a.num=b.num join llogs c on a.id=c.id+2 and b.num=c.num 


