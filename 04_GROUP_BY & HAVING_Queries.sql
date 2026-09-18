use marketplace_db; 
select payment_status , sum(total_amount)
from orders 
group by payment_status;
select payment_status , avg(total_amount)
from orders 
group by payment_status ;
select payment_status , 
min(total_amount),
max(total_amount)
from orders 
group by payment_status ;
select brand ,
count(product_id)
from  products
group by brand ;
select brand ,
avg(weight)
from  products
group by brand ;
select brand ,
sum(weight)
from  products
group by brand ;
select brand ,
max(weight),
min(weight)
from  products
group by brand ;
select payment_status , 
count(order_id),
sum(total_amount),
avg(total_amount)
from orders 
group by payment_status ;
select brand ,
count(product_id),
sum(weight),
avg(weight)
from  products
group by brand ;
select seller_rating ,
count(seller_id),
avg(seller_rating)
from sellers 
group by seller_rating ;
select account_status ,
count(customer_id)
from customers
group by account_status ;
select brand , 
count(product_id)
from products
where description is not null 
group by brand ;
select payment_status , 
sum(total_amount)
from orders 
where total_amount > 20000 
group by payment_status ;
select brand , 
avg(weight)
from products 
where weight > 2
group by brand ;
select payment_status ,
count(order_id),
sum(total_amount)
from orders 
where total_amount between 20000 and 70000 
group by payment_status ;
select account_status ,
count(customer_id)
from customers
where email is not null 
group by account_status ;
select seller_rating ,
count(seller_id),
avg(seller_rating)
from sellers 
where seller_rating > 3 
group by seller_rating ;
 select brand ,
 count(product_id),
 sum(weight)
 from products 
 where weight between 2 and 8 
 group by brand ;
 select payment_status ,
 count(order_id),
 avg(total_amount)
 from orders 
 where total_amount > 10000 and 
 payment_status is not null 
 group by payment_status ;
select payment_status , 
count(order_id)
from orders 
group by payment_status
having count(order_id) > 5 ;
select payment_status ,
sum(total_amount)
from orders 
group by payment_status
having sum(total_amount) > 100000 ;
select payment_status ,
avg(total_amount)
from orders 
group by payment_status
having avg(total_amount) > 30000 ;
select brand , 
count(product_id)
from products
group by brand 
having count(product_id) > 3 ;
select brand , 
min(weight),
max(weight)
from products 
group by brand 
having max(weight) > 8 ;
select payment_status ,
count(order_id),
sum(total_amount)
from orders 
where total_amount > 20000 
and payment_status is not null
group by payment_status 
having count(order_id) > 3 ;
select brand ,
count(product_id),
avg(weight)
from products
where weight > 2 
group by brand 
having avg(weight) > 4 ;
select payment_status ,
count(order_id),
sum(total_amount)
from orders 
where total_amount between 20000 and 80000 
group by payment_status
having sum(total_amount) > 100000 ;
select account_status , 
count(customer_id),
avg(customer_id)
from customers 
where email is not null 
group by account_status
having count(customer_id) > 5 ;
select brand , 
count(product_id), 
sum(weight), 
avg(weight) 
from products
where weight between 1 and 8 
and description is not null 
group by brand 
having count(product_id) > 3
and avg(weight)  > 3 ;
