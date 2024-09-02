---------- Implementing SCD 01 in SQL-----------------------

--- ELT


create table product_stg
(product_id int,
 product_name varchar(10),
 price decimal(9,2));

 create table product_dim
 (product_id int primary key,
  product_name varchar(50),
  price decimal(9,2),
  last_update date);

  insert into product_stg values(1,'IPhone13',40000);
  insert into product_stg values(2,'IPhone14',70000);
  -- insert into product_stg values(1,'IPhone13',60000);


   insert into product_stg values(1,'IPhone13',30000);
  insert into product_stg values(3,'IPhone15',90000);

     insert into product_stg values(2,'IPhone14',40000);
  insert into product_stg values(4,'IPhone16',95000);




  delete from product_stg;


  select * from product_stg;

  select * from product_dim;

  
  declare @newdate date='2024-08-25'
  update product_dim
  set price=product_stg.price,last_update=@newdate
  from product_stg
  where product_stg.product_id=product_dim.product_id

  declare @today date='2024-08-25'
  insert into product_dim 
  select product_id,product_name,price,@today from product_stg
  where product_id not in (select product_id from product_dim);







