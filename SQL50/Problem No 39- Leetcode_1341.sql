------------------------ leetcode 1341----------------------------

Question:-

Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
 

Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.

 

Example 1:

Input: 
Movies table:
+-------------+--------------+
| movie_id    |  title       |
+-------------+--------------+
| 1           | Avengers     |
| 2           | Frozen 2     |
| 3           | Joker        |
+-------------+--------------+
Users table:
+-------------+--------------+
| user_id     |  name        |
+-------------+--------------+
| 1           | Daniel       |
| 2           | Monica       |
| 3           | Maria        |
| 4           | James        |
+-------------+--------------+
MovieRating table:
+-------------+--------------+--------------+-------------+
| movie_id    | user_id      | rating       | created_at  |
+-------------+--------------+--------------+-------------+
| 1           | 1            | 3            | 2020-01-12  |
| 1           | 2            | 4            | 2020-02-11  |
| 1           | 3            | 2            | 2020-02-12  |
| 1           | 4            | 1            | 2020-01-01  |
| 2           | 1            | 5            | 2020-02-17  | 
| 2           | 2            | 2            | 2020-02-01  | 
| 2           | 3            | 2            | 2020-03-01  |
| 3           | 1            | 3            | 2020-02-22  | 
| 3           | 2            | 4            | 2020-02-25  | 
+-------------+--------------+--------------+-------------+
Output: 
+--------------+
| results      |
+--------------+
| Daniel       |
| Frozen 2     |
+--------------+
Explanation: 
Daniel and Monica have rated 3 movies ("Avengers", "Frozen 2" and "Joker") but Daniel is smaller lexicographically.
Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is smaller lexicographically.

 Solution:-
 

create table Movies1
(movie_id int primary key,
 title varchar(10));

 create table Ussers1
 (users_id int primary key,
  nnames varchar(10));

  create table MovieRating1
  (movie_id int,
   users_id int,
   rating int,
   created_at date,
   primary key(movie_id,users_id));

   insert into Movies1 values(1,'Avengers');
   insert into Movies1 values(2,'Frozen 2');
   insert into Movies1 values(3,'Jokers');

   insert into Ussers1 values(1,'Daniel');
   insert into Ussers1 values(2,'Monica');
   insert into Ussers1 values(3,'Maria');
   insert into Ussers1 values(4,'James');

   insert into MovieRating1 values(1,1,3,'2020-01-12');
   insert into MovieRating1 values(1,2,4,'2020-02-11');
   insert into MovieRating1 values(1,3,2,'2020-02-12');
   insert into MovieRating1 values(1,4,1,'2020-01-01');
   insert into MovieRating1 values(2,1,5,'2020-02-17');
   insert into MovieRating1 values(2,2,2,'2020-02-01');
   insert into MovieRating1 values(2,3,2,'2020-03-01');
   insert into MovieRating1 values(3,1,3,'2020-02-22');
   insert into MovieRating1 values(3,2,4,'2020-02-25');

   select * from  Movies1;
   select * from Ussers1;
   select * from MovieRating1;

   /*Write a solution to:
   Find the name of the user who has rated the 
   greatest number of movies. In case of a tie, 
   return the lexicographically smaller user name.
   Find the movie name with the highest average rating in February 2020. 
   In case of a tie, return the lexicographically smaller movie name*/

   (select nnames from Ussers1 u join MovieRating1 r
   on u.users_id=r.users_id
   group by u.users_id
   order by count(rating) desc,nnames 
   limit 1)
   
   union all
   
   (select title from Movies1 m join MovieRating1 r
   on m.movie_id=r.movie_id
   where month(created_at)='02' and year(created_at)='2020'
   group by title
   order by  avg(rating) desc,title
   limit 1)
   
