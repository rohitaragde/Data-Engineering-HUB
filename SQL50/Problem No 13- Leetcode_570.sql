-------------------------- leetcode 570 --------------------------------------

------------------------- Employees with atlease 5 direct reports---------------------------

Question:-
  
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+

Solution:-

create table Emp011
(id int primary key,
nnames varchar(10),
department varchar(10),
managerid int);

insert into Emp011 values(101,'John','A',null);
insert into Emp011 values(102,'Dan','A',101);
insert into Emp011 values(103,'James','A',101);
insert into Emp011 values(104,'Amy','A',101);
insert into Emp011 values(105,'Anne','A',101);
insert into Emp011 values(106,'Ron','B',101);

select * from Emp011;

/* Write a solution to find managers with at least five direct reports.
Return the result table in any order.*/

select * from Emp011;

select nnames from Emp011
where id in (select managerid from Emp011 group by managerid
having count(managerid)>=5);




