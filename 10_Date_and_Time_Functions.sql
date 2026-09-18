use marketplace_db ;
select 
order_id ,
customer_id,
year(order_date) as order_year 
from orders;
select 
order_id ,
customer_id,
month(order_date) as order_month 
from orders;
select 
order_id,
customer_id,
day(order_date) as order_day,
month(order_date) as order_month
from orders;
select 
order_id,
customer_id,
day(order_date) as order_day
from orders;
select 
* from orders 
where year(order_date)=2025;
select 
* from orders 
where month(order_date)=3;
select 
datediff(order_date,current_date) as delivery_date_difference
from orders;
select 
datediff(current_date,order_date) as delivery_date_difference
from orders;
select 
order_id,
date_add(order_date , interval 7 day) as expected_date
from orders;
select 
order_id,
date_sub(order_date , interval 7 day) as expected_date
from orders;
select 
* from orders 
where order_date >= date_sub(current_date , interval 30 day);
select *
from orders 
order by order_date desc 
limit 1;
select *
from orders 
order by order_date asc 
limit 1;
select 
year(order_date) as years,
count(*) as no_of_orders from 
orders 
group by years ;
select 
year(order_date) as for_each_year,
sum(total_amount) as total_spending 
from orders 
group by for_each_year ;
select 
month(order_date) as for_each_month,
count(order_id) as all_orders 
from orders 
group by for_each_month;
select 
month(order_date) as order_month,
sum(total_amount) as all_amount
from orders 
group by order_month ;
select
year(order_date) as avg_amount,
avg(total_amount) as average_amount
from orders
group by avg_amount;
select 
dayofweek(order_date) as dates,
sum(total_amount) as_no_of_amount
from orders
group by dates ;
select 
month(order_date) as months,
year(order_date) as years ,
sum(total_amount) as no_of_amounts from 
orders group by months, years; 
select 
customer_id,
min(order_date) as earliest_order,
max(order_date) as latest_order 
from orders 
group by customer_id ;
select 
customer_id ,
min(order_date) as first_order,
max(order_date) as last_order ,
datediff(max(order_date),min(order_date)) as difference
from orders
group by customer_id;
select 
customer_id ,
max(order_date) as last_order 
from orders
group by customer_id
having max(order_date) >= date_sub(max(order_date),interval 30 day);
select 
customer_id,
max(order_date) as last_order ,
datediff( current_date , max(order_date) )
from orders
group by customer_id ; 
select 
customer_id,
max(order_date) as last_order,
year(max(order_date)) as yearings
from orders 
group by customer_id ;
select 
customer_id,
max(order_date) as last_order,
month(max(order_date)) as yearings
from orders 
group by customer_id ;
select * from orders 
where order_date < date_sub(current_date , interval 90 day );
select
current_date;
select 
customer_id,
min(order_date) as first_order,
datediff(current_date,min(order_date)) 
from orders
group by customer_id;
select 
customer_id,
order_id,
order_date,
year(order_date) as years
from orders 
where year(order_date) = 2025
order by order_date asc;
select 
customer_id,
order_id,
order_date,
year(order_date) as years
from orders 
where year(order_date) = 2025
order by order_date desc;
