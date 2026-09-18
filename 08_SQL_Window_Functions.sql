use marketplace_db;
select 
order_id , 
customer_id , 
total_amount,
sum(total_amount) over (partition by customer_id )
as customer_total from orders;
select 
order_id , 
customer_id,
total_amount,
avg(total_amount) over (partition by customer_id )
as customer_total from orders ;
select 
order_id , 
customer_id,
total_amount,
row_number() over (partition by customer_id
order by total_amount desc )
as order_total from orders ;
select 
order_id , 
customer_id,
total_amount,
rank() over (partition by customer_id
order by total_amount desc )
as customer_rank from orders ;
select 
order_id , 
customer_id,
total_amount,
dense_rank() over (partition by customer_id
order by total_amount desc )
as customer_rank from orders ;
select 
order_id , 
customer_id , 
total_amount, 
lag(total_amount) over (partition by customer_id 
order by order_id) as previous_order 
from orders ;
select 
order_id,
customer_id,
total_amount, 
lead(total_amount)
over (partition by customer_id 
order by order_id ) as upcoming_order 
from orders;
select 
order_id, 
customer_id, 
total_amount,
lag(total_amount)
over (partition by customer_id
order by order_id) as previous_amount,
total_amount - lag(total_amount) 
over(partition by customer_id
order by order_id) as difference_amount
from orders;
select 
order_id, 
customer_id,
total_amount, 
lead(total_amount)
over (partition by customer_id
order by order_id) as next_order_amount, 
total_amount - lead(total_amount) 
over (partition by customer_id
order by order_id ) as lead_difference
from orders ;
select 
order_id,
customer_id,
total_amount, 
sum(total_amount) over(partition by customer_id 
order by order_id) as running_total 
from orders;
select 
order_id,
customer_id,
total_amount, 
count(*) over(partition by customer_id ) as number_of_orders
from orders;
select 
order_id,
customer_id,
total_amount,
avg(total_amount) over(partition by customer_id) as avg_amount
from orders;
select 
order_id, 
customer_id,
total_amount,
total_amount/sum(total_amount) over (partition by customer_id)*100 as customer_percentage
from orders;
select 
order_id, 
customer_id,
total_amount,
rank() over(partition by customer_id
order by total_amount desc) as rankers
from orders; -- this query is for ranking customer within itslef but we need seperate like ranking all orders not within customer 
select 
order_id,
customer_id,
total_amount,
rank() over(order by total_amount desc)
as rankers
from orders;
select 
order_id,
customer_id,
total_amount,
dense_rank() over(order by total_amount desc)
as rankers
from orders;
select 
order_id,
customer_id,
total_amount,
row_number() over(order by total_amount desc)
as rankers
from orders;
select 
order_id,
customer_id,
total_amount, 
row_number () over(partition by customer_id
order by total_amount desc) as order_number
from orders
where order_number=1;
SELECT *
FROM (
    SELECT
        order_id,
        customer_id,
        total_amount,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY total_amount DESC
        ) AS order_number
    FROM orders
) AS ranked_orders
WHERE order_number = 1;
SELECT *
FROM (
    SELECT
        order_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_id
        ) AS order_number
    FROM orders
) AS order_sequence
WHERE order_number = 1;
SELECT *
FROM (
    SELECT
        order_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_id desc
        ) AS order_number
    FROM orders
) AS order_sequence
WHERE order_number = 1;
SELECT *
FROM (
    SELECT
        order_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_id 
        ) AS order_number
    FROM orders
) AS order_sequence
WHERE order_number = 2;
SELECT *
FROM (
    SELECT
        order_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_id asc
        ) AS order_number
    FROM orders
) AS order_sequence
WHERE order_number = 1;
SELECT *
FROM (
    SELECT
        order_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_id 
        ) AS order_number
    FROM orders
) AS order_sequence
WHERE order_number = 1 or order_number = 2;
   select * 
   from (
   SELECT
        order_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_id 
        ) AS order_number
    FROM orders
    ) as order_sequence
where order_number !=1;
   select * 
   from (
   SELECT
        order_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_id desc
        ) AS order_number
    FROM orders
    ) as order_sequence
limit  2 ;
 select * 
   from (
   SELECT
        order_id,
        customer_id,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_id desc
        ) AS order_number
    FROM orders
    ) as order_sequence
where order_number in (1,2) ;
select * from (
select 
order_id,
customer_id,
dense_rank () over ( 
partition by customer_id
order by order_id desc 
) as order_number 
from orders 
) as order_sequence ;
select * from (
select 
order_id,
customer_id,
dense_rank () over ( 
partition by customer_id
order by total_amount desc 
) as order_number 
from orders 
) as order_amount ;
select 
order_id, 
customer_id,
lead(total_amount) over(
partition by customer_id
order by order_id
) as payments 
from orders;
select 
order_id, 
customer_id,
total_amount as present_order,
lag(total_amount) over(
partition by customer_id
order by order_id
) as next_order
from orders;
select 
order_id , 
customer_id , 
total_amount as current_amount,
lag(total_amount) over(
partition by customer_id 
order by order_id 
) as previous_order ,
total_amount - lag(total_amount) over(
partition by customer_id 
order by order_id 
) as difference 
from orders;
select 
order_id , 
customer_id , 
total_amount as current_amount,
lead(total_amount) over(
partition by customer_id 
order by order_id 
) as previous_order ,
total_amount - lead(total_amount) over(
partition by customer_id 
order by order_id 
) as difference 
from orders;
select 
order_id,
customer_id,
total_amount, 
avg(total_amount)  over(
partition by customer_id 
order by order_id 
) as avg_payments 
from orders;
select 
order_id,
customer_id,
total_amount, 
avg(total_amount)  over(
partition by customer_id 
)as avg_payments 
from orders;

