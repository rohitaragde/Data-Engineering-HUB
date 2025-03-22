--------------------- leetcode 1757 ----------------------------------------
-------------- Recyclable and Low Fat products ---------------------------------

Question:-

Table: Products

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+
product_id is the primary key (column with unique values) for this table.
low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
 

Write a solution to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

The result format is in the following example.


Example 1:

Input: 
Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+
Output: 
+-------------+
| product_id  |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: Only products 1 and 3 are both low fat and recyclable.
use rohit;

Solution:-

create table Products001
(product_id int primary key,
low_fats enum('Y','N'),
recyclable enum('Y','N'));

insert into Products001 values(0,'Y','N');
insert into Products001 values(1,'Y','Y');
insert into Products001 values(2,'N','Y');
insert into Products001 values(3,'Y','Y');
insert into Products001 values(4,'N','N');

select * from Products001;

select product_id from Products001
where low_fats='Y' and recyclable='Y'
order by product_id;




