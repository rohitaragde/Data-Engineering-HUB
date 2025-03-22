---------------------------- Leetcode 1148 ----------------------------------
---------------------------- Article Views I --------------------------------
Question:-

Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
There is no primary key (column with unique values) for this table, the table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.
 

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+
Output: 
+------+
| id   |
+------+
| 4    |
| 7    |
+------+

Solution:-
 
create table Views001
(article_id int,
 author_id int,
 viwer_id int,
 view_date date);

 insert into Views001 values(1,3,5,'2019-08-01');
 insert into Views001 values(1,3,6,'2019-08-02');
 insert into Views001 values(2,7,7,'2019-08-01');
 insert into Views001 values(2,7,6,'2019-08-02');
 insert into Views001 values(4,7,1,'2019-07-22');
 insert into Views001 values(3,4,4,'2019-07-21');
 insert into Views001 values(3,4,4,'2019-07-21');

 select * from Views001;

 select distinct author_id as id from Views001
 where author_id=viwer_id
 order by author_id;



