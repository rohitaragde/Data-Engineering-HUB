-------------------------- SCD Type 02 ------------------------------------

--drop table product_stg;
--drop table product_dim;


create table product_stg
(product_id int,
 product_name varchar(10),
 price decimal(9,2));

create table product_dim
(product_key int identity(1,1) primary key,
 product_id int,
 product_name varchar(40),
 price decimal(9,2),
 start_date date,
 end_date date);

 --delete from product_dim;
-- delete from product_stg;

 insert into product_stg values(1,'IPhone13',25000);
 insert into product_stg values(3,'IPhone15',90000);

 declare @today date='2024-08-25'
  update product_dim
  set end_date= dateadd(day,-1,@today)
  from product_stg
  where product_stg.product_id=product_dim.product_id
  and end_date='9999-12-31';



 
  declare @today date='2024-08-24'
  insert into product_dim 
  select product_id,product_name,price,@today,'9999-12-31' from product_stg;

  select * from product_stg;
 select * from product_dim;

 /*
 instead of scalar variable we can us getdate()
 to simulate the output*/




