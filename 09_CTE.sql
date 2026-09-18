use marketplace_db ;
with active_customers as (
select * 
from customers
where account_status = 'active'
)
select * from active_customers;
with customer_orders as (
SELECT
    customer_id,
    COUNT(*)
FROM orders
GROUP BY customer_id
)
select * 
from customer_orders ; 
with customer_orderss as (
select 
customer_id , 
count(*)
from orders 
GROUP BY customer_id
)
select * 
from customer_orders
where orders > 5 ; 
with customer_ordering as (
select 
* 
from orders
where count(orders) > 5
)
select * from 
customer_ordering;
WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
)
SELECT *
FROM customer_orders
WHERE order_count > 5;
WITH customer_orders AS (
    SELECT
        customer_id,
       avg(total_amount) as average
    FROM orders
    group by customer_id
)
SELECT *
FROM customer_orders
WHERE average > 2000 ;
with customers_highest_total as (
select 
customer_id, 
sum(total_amount) as amounts
from orders 
group by customer_id 
)
select * from 
customers_highest_total
where amounts = (select max(amounts)
from customers_highest_total
);	
with customer_order_count as (
select 
customer_id , 
count(*)
from orders 
GROUP BY customer_id
)
select * 
from customer_order_count
where orders > 5 ; 
with customer_order_rate as (
select 
customer_id,
count(order_id) as orderings,
sum(total_amount)
from orders
group by customer_id
)
select * from
customer_order_rate 
where orderings > 3 ;
with average_ordering as (
select customer_id, 
avg(total_amount) as average_amount
from orders 
group by customer_id
)
select * from 
average_ordering 
where  average_amount <1500 ;
with customer_total_spending
as (
select 
customer_id, 
sum(total_amount) as summing
from orders 
group by customer_id
)
select * from 
customer_total_spending
where summing = (select min(summing)
from customer_total_spending
);	 
with number_of_orders as (
select 
customer_id,
count(order_id) as counting
from orders 
group by customer_id
)
select * from 
number_of_orders 
where counting = 5 ;
with maximum_order_amount as (
select 
customer_id,
max(total_amount) as maxxing
from orders 
group by customer_id
)
select * 
from maximum_order_amount 
where maxxing  > 20000 ;
with minimum_order_amount as (
select 
customer_id,
min(total_amount) as minning
from orders 
group by customer_id
)
select * 
from minimum_order_amount 
where minning  < 500 ;
with total_spending as (
select 
customer_id,
sum(total_amount) as total_expenses
from orders 
group by customer_id
)
select * from 
total_spending
order by total_expenses desc
limit  3 ;
with  top_five as  (
select 
customer_id,
count(order_id) as total_orders
from orders 
group by customer_id
)
select * from 
top_five
order by total_orders desc
limit  5 ;
with top_avg_orders as (
select 
customer_id,
avg(total_amount) as average_amount
from orders 
group by customer_id
)
select * 
from top_avg_orders
order by average_amount desc 
limit 3 ;
with total_spending as (
select 
customer_id,
sum(total_amount) as highest_amount
from orders 
group by customer_id
)
select * 
from total_spending
where highest_amount between 5000 and 15000 ;
with top_avg_orders as ( 
select customer_id, 
avg(total_amount) as average_amount 
from orders 
group by customer_id )
select * from top_avg_orders
 order by average_amount 
desc limit 3 ;
with number_of_orders as (
select 
customer_id,
count(order_id) as totalss
from orders 
group by customer_id)
select * 
from number_of_orders
where totalss in (2,5);
with number_of_orders as (
select 
customer_id,
count(order_id) as totalss
from orders 
group by customer_id)
select * 
from number_of_orders
where totalss between 2 and 5;
with highest_order_amount as (
select customer_id ,
max(total_amount) as individual_highest
from orders 
group by customer_id )
select *  
from highest_order_amount 
order  by individual_highest desc 
limit 3 ;
with top_avg_orders as ( 
select customer_id, 
avg(total_amount) as average_amount 
from orders 
group by customer_id )
select * from top_avg_orders
where average_amount between 1000 and 3000  ;
with total_spending as (
select 
customer_id , 
sum(total_amount) as expenses 
from orders 
group by customer_id 
)
select * from total_spending
where expenses  > 10000
order by expenses desc
limit 3 ;
with number_of_orders as (
select 
customer_id ,
count(order_id) as numberings
from orders 
group by customer_id )
select * from 
number_of_orders
where numberings = 5
order by numberings desc
limit 3 ;
with number_of_orders as (
select 
customer_id ,
count(order_id) as numberings
from orders 
group by customer_id )
select * from 
number_of_orders
where numberings >= 5
order by numberings desc
limit 3 ;
with number_of_orders as (
select 
customer_id ,
sum(total_amount) as amounts
from orders 
group by customer_id )
select * from 
number_of_orders
order by amounts asc
limit 3 ;
with number_of_orders as (
select 
customer_id ,
avg(total_amount) as amounts
from orders 
group by customer_id )
select * from 
number_of_orders
order by amounts asc
limit 3 ;
with number_of_orders as (
select 
customer_id ,
sum(total_amount) as amountss
from orders 
group by customer_id)
select * from 
number_of_orders
where amountss > (select avg(amountss)
from number_of_orders );
with number_of_orders as (
select customer_id,
count(order_id) as totals
from orders 
group by customer_id)
select * from number_of_orders
where totals > (select avg(totals) 
from number_of_orders ) ;
with highest_amount as (
select customer_id,
max(total_amount) as totals
from orders 
group by customer_id)
select * from highest_amount
where totals > (select avg(totals) 
from highest_amount ) ;
with highest_amount as (
select customer_id,
sum(total_amount) as totals
from orders 
group by customer_id)
select * from highest_amount
where totals < (select avg(totals) 
from highest_amount ) ;
with number_of_orders as (
select customer_id,
count(order_id) as totals
from orders 
group by customer_id)
select * from number_of_orders
where totals > (select avg(totals) 
from number_of_orders ) ; 
with number_of_orders as (
select customer_id,
count(order_id) as totals
from orders 
group by customer_id)
select * from number_of_orders
where totals = ( select max(totals) 
from number_of_orders ) ;
