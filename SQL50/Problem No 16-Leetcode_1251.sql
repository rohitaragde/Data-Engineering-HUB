---------------------------- Leetcode 1251----------------------------------

--------------------------- Average Selling Price ----------------------------
Question:-
 
Table: Prices

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+
(product_id, start_date, end_date) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the price of the product_id in the period from start_date to end_date.
For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
 

Table: UnitsSold

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+
This table may contain duplicate rows.
Each row of this table indicates the date, units, and product_id of each product sold. 
 

Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Prices table:
+------------+------------+------------+--------+
| product_id | start_date | end_date   | price  |
+------------+------------+------------+--------+
| 1          | 2019-02-17 | 2019-02-28 | 5      |
| 1          | 2019-03-01 | 2019-03-22 | 20     |
| 2          | 2019-02-01 | 2019-02-20 | 15     |
| 2          | 2019-02-21 | 2019-03-31 | 30     |
+------------+------------+------------+--------+
UnitsSold table:
+------------+---------------+-------+
| product_id | purchase_date | units |
+------------+---------------+-------+
| 1          | 2019-02-25    | 100   |
| 1          | 2019-03-01    | 15    |
| 2          | 2019-02-10    | 200   |
| 2          | 2019-03-22    | 30    |
+------------+---------------+-------+
Output: 
+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+
Explanation: 
Average selling price = Total Price of Product / Number of products sold.
Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96
Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96

 Solution:-

 
create table Prices1
(product_id int,
 start_dates date,
 end_dates date,
 price int,
 primary key(product_id,start_dates,end_dates));

 create table UnitsSold1
 (product_id int,
  purchase_date date,
  units int);

  insert into Prices1 values(1,'2019-02-17','2019-02-28',5);
  insert into Prices1 values(1,'2019-03-01','2019-03-22',20);
  insert into Prices1 values(2,'2019-02-01','2019-02-20',15);
  insert into Prices1 values(2,'2019-02-21','2019-03-31',30);


  insert into UnitsSold1 values(1,'2019-02-25',100);
  insert into UnitsSold1 values(1,'2019-03-01',15);
  insert into UnitsSold1 values(2,'2019-02-10',200);
  insert into UnitsSold1 values(2,'2019-03-22',30);

  select * from Prices1;
  select * from UnitsSold1;

  /*
  Write a solution to find the average selling price for each product.
  average_price should be rounded to 2 decimal places.
Return the result table in any order.
*/

select p.product_id,
round(sum(u.units*p.price)/sum(u.units),2) as average_price   
from Prices1 p join UnitsSold1 u
on p.product_id=u.product_id
where u.purchase_date between p.start_dates and p.end_dates
group by p.product_id 


