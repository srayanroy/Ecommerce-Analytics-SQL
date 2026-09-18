use marketplace_db ; 
select product_name ,
CASE 
when weight > 5 then 'heavy' 
else 'light'
end as weight_category 
from products ;
select order_id ,
case 
when total_amount > 50000 then 'high' 
else 'low' 
end as order_size
from orders ;
select 
payment_status ,
case 
when payment_status = 'paid' then 'successful'
when payment_status = 'pending' then 'waiting'
else 'other'
end as payment_category
from orders; 
select 
customer_id ,
case 
when account_status = 'active' then 'active customer'
when account_status = 'inactive' then 'inactive customer'
else 'unknown' 
end as account_category 
from customers ;
select product_name ,
case 
when weight > 5 then 'heavy' 
when weight > 2 then 'medium'
else 'light'
end as weight_level 
from products ;
select order_id ,
case 
when total_amount > 50000 then 'high' 
when total_amount between 20000 and  50000 then 'medium'
else 'low' 
end as amount_category 
from orders ;
select 
product_name , 
case 
when weight >= 8 then 'Very_Heavy'
when weight >= 5 then 'Heavy'
when weight >= 2 then 'medium'
else 'light'
end as weight_category 
from products ;
select order_id ,
case 
when total_amount >= 70000 then 'High Priority'
when total_amount >= 40000 then 'Medium Priority'
else 'low_priority'
end as 'order_priority'
from orders;
select seller_id ,
case 
when seller_rating >= 4.5 then 'excellent'
when seller_rating >=4 then 'Good'
when seller_rating >=3 then 'average'
else 'poor'
end as rating_category 
from sellers ; 
select customer_id ,
case 
when email_verified = 1 and phone_verified = 1 then 'fully_verfied'
when email_verified = 1 or phone_verified = 1 then 'Partially_verified'
else 'not_verified'
end as verification_status
from customers ; 
select product_name ,
case 
when brand = 'apple' or brand = 'samsung' then 'top_brand'
when brand = 'sony' or brand = 'lg' then 'other major brand' 
else 'other' 
end as brand_category 
from products ;
select order_id ,
case
when payment_status in ('paid','pending') then 'active'
when payment_status = 'failed' then 'Failed'
else 'unknown'
end as product_category
from orders;
select product_name ,
case 
when description is null then 'missing description'
else 'descritpion available'
end as 'description_status'
from products ;
select customer_id ,
case 
when email is null and phone_number is null then 'no_contact'
else 'contact_available'
end as 'contact_status'
from customers ;
select seller_id ,
case 
when seller_rating is null then 'not_rated'
when seller_rating >= 4.5 then 'excellent'
when seller_rating >=3 then 'good'
else 'improvement_needed'
end as seller_level
from sellers ;
select order_id ,
case 
when total_amount between 50000 and 100000 and payment_status = 'paid' then 'premium paid '
when total_amount between 20000 and 50000 and payment_status = 'paid' then 'regular paid'
else 'other'
end as 'order_segment' 
from orders;
select product_name , 
case 
when brand = 'apple' and weight > 5 then 'heavy apple'
when brand = 'samsung' and weight > 5 then 'heavy samsung'
else 'other'
end as brand_type 
from products;
select order_id ,
case 
when order_status = 'delivered' then 'completed'
when order_status = 'shipped' then 'in transit'
when order_status = 'cancelled' then 'Cancelled'
else 'processing'
end as 'delivery_category'
from orders ;
select seller_id , 
case 
when account_status = 'active' and seller_rating >= 4 then 'top active seller' 
when account_status = 'active' and seller_rating < 4 then 'regular active seller' 
when account_status = 'inactive'  then 'inactive seller' 
else 'unknown'
end as 'seller_status_category'
from sellers;
select customer_id , 
case 
when account_status = 'active' and email_verified = 1 and phone_verified = 1 then 'premium customer'
when account_status = 'active' and (email_verified = 1 or phone_verified = 1) then 'verified customer' 
when account_status = 'inactive' then 'Unverified Customer'
else 'inactive user'
end as 'customer_type' 
from customers ;
select 
count(
case 
when payment_status = 'paid' then 'paid'
end ) as 'paid'
from orders ;
select 
count(
case 
when payment_status = 'paid' then 'paid'
when payment_status = 'pending' then 'pending' 
end ) as order_status 
from orders ;
SELECT 
    COUNT(order_id) AS total_orders,
    COUNT(
CASE 
WHEN payment_status = 'paid' THEN 1
END
    ) AS paid_orders,
    COUNT(
CASE 
WHEN payment_status = 'pending' THEN 1
        END
    ) AS pending_orders
FROM orders;
select 
count(total_amount) as total_sales ,
count(
case 
when payment_status = 'paid' then 1 
end  ) as 'paid orders'
from orders;
select 
sum(total_amount) as total_sales ,
sum(
case 
when payment_status = 'paid' then total_amount
else 0 
end  ) as 'paid orders'
from orders;
SELECT
count(product_id) as total_products , 
count( 
case 
when weight > 5 then 1
end) as 'Counting_Products'
from products;
select 
count(order_id),
count(
case 
when total_amount > 50000 then 1 
end ) as 'total_orders'
from orders;
select count(customer_id),
count(
case 
when account_status = 'active' then 1 
end ) as 'account_status_active_people'
from customers;
select count(seller_id),
count(
case 
when seller_rating >=4 then 1 
end ) as 'higher_seller_rating'
from sellers;
select count(product_id),
count(
case 
when description is not null then 1
end ) as 'description_is_THERE' ,
count(
case 
when description is null then 1
end ) as 'description_is_not_there'
from products ;
select count(order_id),
count(
case 
when payment_status = 'paid' then 1
end ) as 'paid_orders' , 
count(
case 
when payment_status = 'pending' then 1
end ) as 'pending_orders',
count( 
case 
when payment_status = 'failed' then 1
end ) as 'failed_orders'
from orders;
