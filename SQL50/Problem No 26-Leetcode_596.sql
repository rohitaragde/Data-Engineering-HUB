---------------------------- Leetcode 596------------------------------------

-------------------------- Classes more than 5 students ---------------------------------


Question:-
  
Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
 

Write a solution to find all the classes that have at least five students.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+
Explanation: 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.

  Solution:-

create table CoursesI
(student varchar(10),
class varchar(10),
primary key(student,class));

insert into CoursesI values('A','Math');
insert into CoursesI values('B','English');
insert into CoursesI values('C','Math');
insert into CoursesI values('D','Biology');
insert into CoursesI values('E','Math');
insert into CoursesI values('F','Computer');
insert into CoursesI values('G','Math');
insert into CoursesI values('H','Math');
insert into CoursesI values('I','Math');

select * from CoursesI;

/*
Write a solution to find all the classes that have at least five students.
Return the result table in any order.*/

select class from CoursesI
group by class 
having count(student)>=5;


