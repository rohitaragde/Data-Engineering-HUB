----------------------- Leetcode 584 ----------------------------------

---------------------- Find Customer Referee----------------------------

Question:- 

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Find the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

 Solution:- 

create table Cust001
(id int primary key,
 name varchar(10),
 referee_id int);

 insert into Cust001 values(1,'Will',null);
 insert into Cust001 values(2,'Jane',null);
 insert into Cust001 values(3,'Alex',2);
 insert into Cust001 values(4,'Bill',null);
 insert into Cust001 values(5,'Zack',1);
 insert into Cust001 values(6,'Mark',2);

 select * from Cust001; 

 select name from Cust001
 where id not in (select id from Cust001 where referee_id=2);



