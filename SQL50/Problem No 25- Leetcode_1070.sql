---------------------------- leetcode 1070-----------------------------------------

-------------------------- Product Sales Analysis III-------------------------------

Question:-
 

Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.
 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
 

Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

Return the resulting table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+

 Solution:-
 

create table SalesI
(sale_id int,
 product_id int,
 yyear int,
 quantity int,
 price int,
 primary key(sale_id,yyear),
 foreign key(product_id) references ProductsI(product_id));

 create table ProductsI
 (product_id int primary key,
 product_name varchar(10));

 insert into ProductsI values(100,'Nokia');
 insert into ProductsI values(200,'Apple');
 insert into ProductsI values(300,'Samsung');

 select * from ProductsI;

 insert into SalesI values(1,100,2008,10,5000);
 insert into SalesI values(2,100,2009,12,5000);
 insert into SalesI values(7,200,2011,15,9000);

  select * from ProductsI;

  select * from SalesI;

 /*Write a solution to select the product id, year, quantity,
 and price for the first year of every product sold.
 Return the resulting table in any order.*/

select product_id, yyear as first_year,
quantity,price
from SalesI
where (product_id,yyear) in
(select product_id,min(yyear) as f_year
from SalesI group by product_id)
order by 1;




 
