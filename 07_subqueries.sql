use marketplace_db ;
select *
from orders 
where total_amount > (select max(total_amount)
from orders
where payment_status = 'pending');
select * 
from orders 
where total_amount < (select avg(total_amount)
from orders 
where payment_status = 'paid');
select * 
from orders 
where total_amount = (select max(total_amount)
from orders );
select * 
from orders 
where total_amount = (select max(total_amount)
from orders );
select *
from orders
where total_amount > (select avg(total_amount)
from orders );
select * from
orders 
where total_amount < (select min(total_amount)
from orders 
where payment_status = 'paid' );
select 
* from 
orders 
where total_amount > (select avg(total_amount)
from orders 
where payment_status = 'paid') ;
select * 
from orders 
where total_amount = (select min(total_amount)
from orders 
);
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
);
select * from customers 
where customer_id in (select customer_id 
from orders );
select 
* from customers 
where customer_id not in ( select (customer_id)
from 
orders);
select * from products 
where proudct_id in (select seller_product_id 
from seller_products where (select order_items_id 
from order_items);
select * from products where 
product_id in (select  seller_product_id
from seller_products where seller_product_id in (select order_item_id from order_items ));
