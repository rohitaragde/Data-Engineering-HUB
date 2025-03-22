------------------------------ Leetcode 176-------------------------------------
----------------------------- Second Highest Salary-----------------------------

Question:-
 
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+

Solution:-
 
create table EmpSal11
(id int primary key,
 salary int);

<<<<<<< HEAD
 --- TestCase I----
=======
-----------TestCase I-----------------
>>>>>>> 605b902a7ac955c31e7221b3fe042bd07039426e
insert into EmpSal11 values(1,100);
insert into EmpSal11 values(2,200);
insert into EmpSal11 values(3,300);

<<<<<<< HEAD
--- TestCase II-----
=======
----------TestCase II------------------
>>>>>>> 605b902a7ac955c31e7221b3fe042bd07039426e
insert into EmpSal11 values(1,100);

select * from EmpSal11;

select max(salary) as secondHighestSalary
from EmpSal11
where salary <(select max(salary) from EmpSal11)


