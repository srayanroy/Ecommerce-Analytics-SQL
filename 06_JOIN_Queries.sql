use marketplace_db; 
select 
o.order_id ,
c.first_name,
o.total_amount
from orders as o 
inner join customers as c
on o.customer_id = c.customer_id ;
select 
o.order_id ,
c.first_name
from orders as o 
inner join customers as c
on o.customer_id = c.customer_id ;
select 
o.order_id , 
c.first_name ,
c.account_status
from customers as c
inner join orders as o
on o.customer_id = c.customer_id ;
select 
o.order_id, 
c.first_name ,
o.total_amount
from  orders as o 
inner join customers as c
on o.order_id=c.customer_id ;
select 
o.order_id, 
c.first_name ,
o.payment_status 
from orders as o 
inner join customers as c 
on o.customer_id = c.customer_id ;
select 
o.order_id, 
c.first_name ,
o.order_status 
from orders as o 
inner join customers as c 
on o.customer_id = c.customer_id ;
select 
c.customer_id, 
c.first_name ,
o.payment_status
from customers as c
left join orders as o
on o.customer_id = c.customer_id ;
select 
c.customer_id, 
c.first_name ,
o.total_amount
from customers as c
left join orders as o
on o.customer_id = c.customer_id ;
 select 
c.customer_id , 
c.first_name ,
o.payment_status
from customers as c
left join orders as o 
on c.customer_id = o.customer_id ;
 select 
c.customer_id , 
c.first_name ,
o.total_amount
from customers as c
left join orders as o 
on c.customer_id = o.customer_id ;
select 
o.order_id , 
c.first_name , 
o.total_amount 
from orders as o 
left join customers as c
on c.customer_id = o.customer_id 
where o.total_amount > 50000  ;
select 
o.order_id , 
c.first_name , 
o.total_amount 
from orders as o 
 join customers as c
on c.customer_id = o.customer_id 
where o.total_amount > 50000  ;
select 
o.order_id , 
c.first_name , 
o.payment_status
from orders as o 
 join customers as c
on c.customer_id = o.customer_id 
where payment_status = 'paid'  ;
select 
o.order_id , 
c.first_name,
o.order_status
from orders as o 
join customers as c 
on c.customer_id = o.customer_id 
where order_status = 'delivered' ;
select 
o.order_id , 
c.first_name,
o.total_amount
from orders as o 
join customers as c
on c.customer_id = o.customer_id  
where total_amount between 20000 and 50000 ;
select 
o.order_id , 
c.first_name,
o.payment_status 
from orders as o 
join customers as c 
on c.customer_id = o.customer_id   
where o.payment_status  in ('paid','pending');
select 
o.order_id ,
c.first_name,
o.total_amount 
from orders as o 
join customers as c
on c.customer_id = o.customer_id    
where total_amount > 50000 and  payment_status = 'paid' ;
select 
c.customer_id ,
c.first_name ,
count(o.order_id) as number_of_orders 
from orders as o
left join customers as c 
on c.customer_id = o.customer_id 
group by
c.customer_id ,
c.first_name  ;
select 
c.customer_id ,
c.first_name ,
count(o.order_id) as number_of_orders 
from customers as c
left join orders as o
on c.customer_id = o.customer_id 
group by
c.customer_id ,
c.first_name  ;
select 
c.customer_id ,
c.first_name ,
sum(o.total_amount) as total_sales
from customers as c
left join orders as o
on c.customer_id = o.customer_id 
group by 
c.customer_id ,
c.first_name ;
select 
c.customer_id ,
c.first_name ,
avg(o.total_amount) as Average_Amount
from customers as c
left join orders as o
on c.customer_id = o.customer_id 
group by 
c.customer_id ,
c.first_name ;
select 
c.customer_id ,
c.first_name ,
sum(o.total_amount) as total_sales
from customers as c
left join orders as o
on c.customer_id = o.customer_id 
group by 
c.customer_id ,
c.first_name 
having sum(o.total_amount)  > 500000  ; 
select 
o.order_id, 
c.first_name ,
o.total_amount ,
case 
when o.total_amount > 50000 then 'high'
else 'low'
end as order_category
from customers as c
join orders as o 
on c.customer_id = o.customer_id ;
select 
o.order_id ,
c.customer_id ,
o.payment_status,
case 
when o.payment_status = 'paid' then 'paid_order'
when o.payment_status = 'pending' then 'pending_order'
else 'other'
end as payment_status
from customers as c
join orders as o
on c.customer_id = o.customer_id ;
select 
c.customer_id ,
c.first_name ,
c.account_status,
case
when account_status = 'Active' then 'active_customer'
when account_status = 'inactive' then 'Inactive_customer'
when account_status = 'suspended' then 'Suspended_customer'
end as account_category
from customers as c
join orders as o 
on c.customer_id = o.customer_id ;
select 
o.order_id , 
c.first_name ,
p.product_name 
from products as p 
join order_items as o 
on o.customer_id =  p.customer_id
join customers as c 
on o.customer_id =  c.customer_id ;
select 
o.order_id , 
c.first_name ,
oi.order_item_id 
from customers as c
join  orders as o
on o.customer_id =  c.customer_id 
join order_items as oi
on o.order_id = oi.order_id  ;
select 
o.order_id , 
c.first_name ,
oi.quantity
from customers as c
join  orders as o
on o.customer_id =  c.customer_id 
join order_items as oi
on o.order_id = oi.order_id  ;
select 
o.order_id , 
c.first_name ,
oi.quantity
from customers as c
join  orders as o
on o.customer_id =  c.customer_id 
join order_items as oi
on o.order_id = oi.order_id  ;
select 
o.order_id , 
c.first_name ,
oi.order_item_id ,
se.seller_product_id,
p.product_name
from customers as c
join  orders as o
on o.customer_id =  c.customer_id 
join order_items as oi
on o.order_id = oi.order_id 
join seller_products as se
on oi.seller_product_id = se.seller_product_id
join products as p 
on se.product_id = p.product_id ;
