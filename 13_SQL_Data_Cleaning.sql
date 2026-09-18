use marketplace_db ;
select count(*) as email_handlers
from customers 
group by email 
having count(*) > 1 ;
select count(*) as together
from customers 
group by first_name,last_name,email 
having count(*) > 1 ; 
select count(*) as together
from customers 
where phone_number is not null
group by  phone_number
having count(*) > 1 ;
select count(*) as together
from orders
group by country
having count(*) > 1 ;
select count(*) 
from products
where description is null ;
select
count(*)
from products 
where weight is null or weight <= 0 ;
select 
count(*)
from seller_products
where selling_price <=0;
select 
count(*)
from seller_products
where stock_quantity <=0;
select 
count(*)
from seller_products
where stock_quantity < 0;
select  seller_product_id,seller_id, discount_percentage < 0
OR
discount_percentage > 100 as discount_percentage
from seller_products;
SELECT 
    COUNT(*) AS invalid_discounts
FROM seller_products
WHERE discount_percentage < 0
   OR discount_percentage > 100;
   select
   count(*) as invalid_amount
   from orders
   where total_amount <=0;
   select 
   count(*) as invalid_reviews
   from reviews
   where rating < 1
OR
rating > 5 ;
select count(*) as invalid_discounts
from coupons
where discount_value < 0;
select 
coupon_id,
coupon_code,
start_date,
expiry_date
from coupons
where expiry_date < start_date;
select
shipped_date,
expected_delivery_date,
delivered_date
from shipments
where delivered_date < shipped_date;
select
total_amount,
order_status,
payment_status
from orders
where payment_status = 'paid'
and total_amount=0;
select
payment_id,
amount_paid,
order_id,
payment_status
from payments
where  payment_status = 'successful'
and amount_paid=0;
SELECT
    payment_id,
    order_id,
    amount_paid,
    payment_status
FROM payments
WHERE payment_status = 'Successful'
  AND amount_paid = 0;
  select
  payment_id,
order_id,
transaction_id,
payment_status
from payments
where payment_status = 'Successful'
AND transaction_id IS NULL;
select 
shipment_id,
order_id,
tracking_number,
shipment_status
from shipments 
where tracking_number is null;
select
shipment_status,
delivered_date
from shipments
where  delivered_date is not null
and shipment_status != 'delivered' ;
select
order_id,
order_status,
payment_status,
total_amount
from orders
where
order_status = 'Cancelled'
AND payment_status = 'Paid';
select
shipment_id,
order_id,
shipped_date,
expected_delivery_date
from shipments 
where 
 expected_delivery_date > shipped_date ;
