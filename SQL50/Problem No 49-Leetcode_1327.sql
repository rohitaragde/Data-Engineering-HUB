----------------------------- Leetcode 1327--------------------------------------

------------------- List the Products Ordered in a Period-----------------------
Question:-
 
Table: Products

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id is the primary key (column with unique values) for this table.
This table contains data about the company's products.
 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.
 

Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+-------------+-----------------------+------------------+
| product_id  | product_name          | product_category |
+-------------+-----------------------+------------------+
| 1           | Leetcode Solutions    | Book             |
| 2           | Jewels of Stringology | Book             |
| 3           | HP                    | Laptop           |
| 4           | Lenovo                | Laptop           |
| 5           | Leetcode Kit          | T-shirt          |
+-------------+-----------------------+------------------+
Orders table:
+--------------+--------------+----------+
| product_id   | order_date   | unit     |
+--------------+--------------+----------+
| 1            | 2020-02-05   | 60       |
| 1            | 2020-02-10   | 70       |
| 2            | 2020-01-18   | 30       |
| 2            | 2020-02-11   | 80       |
| 3            | 2020-02-17   | 2        |
| 3            | 2020-02-24   | 3        |
| 4            | 2020-03-01   | 20       |
| 4            | 2020-03-04   | 30       |
| 4            | 2020-03-04   | 60       |
| 5            | 2020-02-25   | 50       |
| 5            | 2020-02-27   | 50       |
| 5            | 2020-03-01   | 50       |
+--------------+--------------+----------+
Output: 
+--------------------+---------+
| product_name       | unit    |
+--------------------+---------+
| Leetcode Solutions | 130     |
| Leetcode Kit       | 100     |
+--------------------+---------+
Explanation: 
Products with product_id = 1 is ordered in February a total of (60 + 70) = 130.
Products with product_id = 2 is ordered in February a total of 80.
Products with product_id = 3 is ordered in February a total of (2 + 3) = 5.
Products with product_id = 4 was not ordered in February 2020.
Products with product_id = 5 is ordered in February a total of (50 + 50) = 100.

 Solution:-
 

create table Productss1
(product_id int primary key,
 product_name varchar(10),
 product_category varchar(10));


 create table orderss1
 (product_id int,
 order_date date,
 unit int,
 foreign key(product_id) references Productss1(product_id));

 insert into Productss1 values(1,'Leetcode Solutions','Book');
 insert into Productss1 values(2,'Jewels of Stringology','Book');
 insert into Productss1 values(3,'HP','Laptop');
 insert into Productss1 values(4,'Lenovo','Laptop');
 insert into Productss1 values(5,'Leetcode Kit','T-shirt');

 insert into orderss1 values(1,'2020-02-05',60);
 insert into orderss1 values(1,'2020-02-10',70);
 insert into orderss1 values(2,'2020-01-18',30);
 insert into orderss1 values(2,'2020-02-11',80);
 insert into orderss1 values(3,'2020-02-17',2);
 insert into orderss1 values(3,'2020-02-24',3);
 insert into orderss1 values(4,'2020-03-01',20);
 insert into orderss1 values(4,'2020-03-04',30);
 insert into orderss1 values(4,'2020-03-04',60);
 insert into orderss1 values(5,'2020-02-25',50);
 insert into orderss1 values(5,'2020-02-27',50);
 insert into orderss1 values(5,'2020-03-01',50);

 select * from Productss1

 select * from orderss1

 /*Write a solution to get the names of products that have
 at least 100 units ordered in February 2020 and their amount.
Return the result table in any order.*/

select p.product_name,sum(o.unit) as unit
from Productss1 p join orderss1 o
on p.product_id=o.product_id
where order_date between '2020-02-01' and '2020-02-29'
group by p.product_name
having sum(o.unit)>=100;







