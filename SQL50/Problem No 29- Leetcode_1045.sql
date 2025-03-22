------------------------- Leetcode 1045 -----------------------------------

-------------------- Customers who Bought All Products-----------------------

Question:-
 
Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.
 

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table.
 

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+
Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+
Output: 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: 
The customers who bought all the products (5 and 6) are customers with IDs 1 and 3.

Solution:-

create table Cust1
(cust_id int not null,
 product_key int,
 foreign key(product_key) references Prod1(product_key));



create table Prod1
(product_key int primary key);

insert into Prod1 values(5);
insert into Prod1 values(6);

insert into Cust1 values(1,5);
insert into Cust1 values(2,6);
insert into Cust1 values(3,5);
insert into Cust1 values(3,6);
insert into Cust1 values(1,6);

select * from Prod1;
select * from Cust1;

/*Write a solution to report the customer ids from the Customer table
that bought all the products in the Product table.
Return the result table in any order.*/

select * from Prod1;
select * from Cust1;


select cust_id 
from Cust1
group by cust_id
having count(distinct product_key)=
( select count(product_key) from Prod1);









