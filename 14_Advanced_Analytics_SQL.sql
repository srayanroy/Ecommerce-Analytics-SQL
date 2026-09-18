use marketplace_db ;
select 
seller_id,
avg(seller_price)
from seller_products
group by seller_id;
select 
total_amount
from orders
group by order_id;
select 
customer_id,
max(total_amount)
from orders
group by customer_id
limit 1 ;
select 
customer_id,
sum(total_amount)
from orders
group by customer_id
order by sum(total_amount) desc
limit 1 ;
select
count(order_id),
customer_id
from orders
group by customer_id ;
select
count(order_id) as countings,
customer_id
from orders
group by customer_id 
order by countings desc
limit 1;
select 
order_status,
sum(total_amount) as total_revenue
from orders 
group by order_status;
select 
order_status,
avg(total_amount) as average_revenue
from orders 
group by order_status;
select 
order_status,
sum(total_amount) as total_revenue
from orders 
group by order_status
order by total_revenue desc;
select 
order_status,
max(total_amount) as total_revenue
from orders 
group by order_status
order by total_revenue desc;
select 
order_status,
min(total_amount) as total_revenue
from orders 
group by order_status
order by total_revenue desc;
select 
sum(quantity)
from order_items
group by order_id ;
select 
sum(quantity)
from order_items
group by seller_product_id ;
SELECT
    seller_products.seller_id,
    SUM(order_items.total_price) AS total_revenue
FROM order_items
JOIN seller_products
    ON order_items.seller_product_id = seller_products.seller_product_id
GROUP BY seller_products.seller_id;
select 
seller_id,
avg(selling_price) as average_selling_price
from seller_products
group by seller_id;
select 
seller_id,
max(selling_price) as average_selling_price
from seller_products
group by seller_id
order by average_selling_price desc ;
select 
seller_id,
min(selling_price) as average_selling_price
from seller_products
group by seller_id
order by average_selling_price desc ;
select 
seller_products.seller_product_id,
sum(order_items.quantity) as total_quantity
from order_items
join seller_products on seller_products.seller_product_id = order_items.seller_product_id
group by seller_products.seller_product_id;
select
count(order_id)
from orders
group by order_status;
select 
payment_status,
sum(total_amount) as total_summing
from orders
group by payment_status;
select
payment_method,
avg(amount_paid) as average_amounts
from payments
group by payment_method;
select
payment_method,
sum(amount_paid) as average_amounts
from payments
group by payment_method;
select
payment_method,
max(amount_paid) as highest_amounts
from payments
group by payment_method;
select
payment_method,
min(amount_paid) as highest_amounts
from payments
group by payment_method;
select 
return_status,
sum(refund_amount)
from 
returns
group by return_status;
select 
return_status,
avg(refund_amount)
from 
returns
group by return_status;
select 
return_status,
count(return_id)
from 
returns
group by return_status;
select 
avg(rating)
from 
reviews;
select 
customer_id,
count(review_id)
from reviews
group by customer_id;
select 
seller_id,
count(seller_product_id)
from seller_products
group by seller_id;
select 
seller_id,
sum(stock_quantity)
from seller_products
group by seller_id;
select 
brand,
count(product_id)
from products
group by brand;
