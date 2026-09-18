use marketplace_db;
select count(*) from customers;
select count(phone_number)
 from customers;
select count(payment_status)  
from orders 
where payment_status is not null ;
select count(*) from orders ;
select count(*) 
from orders 
where payment_status = 'paid';
select count(*) 
from orders 
where total_amount > 50000 ;
select count(description) 
from products;
 -- select count(email)  
 -- from customers --
 -- where having phone_number; --
 select count(*)
 from customers 
 where email is not null 
 and phone_number is not null ;
 select sum(total_amount)
 from orders;
select avg(total_amount) 
from orders;
select min(total_amount) 
from orders;
select max(total_amount) 
from orders;
select count(order_id) , sum(total_amount)
, avg(total_amount) , min(total_amount) ,
max(total_amount) from orders ;  -- for where condition we should use and if no where we can use comma like this -- 
select count(order_id) , sum(total_amount) , avg(total_amount)
from orders
where payment_status = 'paid' ; 
select max(total_amount) , min(total_amount) , avg(total_amount)
from orders
where payment_status = 'paid' ;
select sum(total_amount) , count(order_id)
from orders
where total_amount > 30000 ;
select count(order_id) , avg(total_amount) , max(order_id) 
from orders
 where total_amount > 20000 and payment_status = 'paid' ;
 select count(total_amount) , avg(total_amount) , max(total_amount) 
from orders
 where total_amount > 20000 and payment_status = 'paid' ;
 select count(total_amount) , 
 sum(total_amount) , 
 avg(total_amount) ,
 min(total_amount) , 
 max(total_amount)
 from orders
 where payment_status = 'paid' ;
 select count(total_amount) , avg(total_amount)
 from orders 
 where  (payment_status = 'paid' or payment_status = 'pending')
 and total_amount > 20000 ;
 select count(product_id) , 
 sum(weight),
 avg(weight),
 min(weight),
 max(weight)
 from products 
 where weight > 2 ;
 select sum(total_amount) , avg(total_amount) , max(total_amount)
 from orders 
 where  (payment_status = 'paid' or payment_status = 'pending' )
 and total_amount between 10000 and 80000 ;
 select count(customer_id) 
 from customers 
 where account_status in ('active' , 'inactive')
 and  email is not null ;
 select count(total_amount) , max(total_amount) 
 from orders 
 where payment_status = 'paid' 
 and total_amount between 20000 and 70000 ;
 select sum(total_amount) , max(total_amount) 
 from orders 
 where payment_status = 'paid' 
 and total_amount between 20000 and 70000 ;
 select 
 count(order_id) ,
 sum(total_amount),
 avg(total_amount)
 from orders 
 where payment_status in ('paid' , 'pending')
 and total_amount > 30000 ;
 select count(product_id) ,
 sum(weight) , 
 avg(weight)
 from products
 where brand in ('apple','samsung' ,'sony') 
 and weight between 1 and 5 ;
 select min(weight),
 max(weight)
 from products 
 where brand in ('apple' , 'samsung')
 and description is not null ;
 select count(seller_id),
 avg(seller_rating),
 min(seller_rating),
 max(seller_rating)
 from sellers 
 where seller_rating is not null ;
 select sum(total_amount),
 avg(total_amount),
 count(total_amount)
 from orders
 where payment_status = 'Failed' 
 and total_amount > 10000 ;
 select sum(total_amount) , 
 min(total_amount),
 max(total_amount) 
 from orders 
 where payment_status in ('paid' , 'pending')
 and total_amount between 15000 and 60000 ;
 select count(product_id),
 sum(weight),
 max(weight)
 from products 
 where brand in ('apple','samsung','sony')
 and weight > 2 and description is not null ;
 select count(customer_id),
 avg(customer_id),
 max(customer_id)
 from customers 
 where account_status in ('active','inactive')
 and email is not null ;
 select count(order_id),
 sum(total_amount),
 avg(total_amount),
 min(total_amount),
 max(total_amount)
 from orders 
 where payment_status in ('paid','pending')
 and total_amount between 20000 and 80000 
 and total_amount is not null ;
 
