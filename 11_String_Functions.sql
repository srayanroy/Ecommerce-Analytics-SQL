use marketplace_db ;
select 
customer_id,
upper(first_name) as capital
from customers;
select 
customer_id,
lower(last_name) as capital
from customers;
select 
customer_id,
length(first_name) as capital
from customers;
select 
customer_id,
trim(first_name) as capital
from customers;
select 
customer_id,
upper(concat(first_name, ' ' ,last_name)) as capital
from customers;
select 
customer_id,
left(first_name,3) as capital
from customers;
select 
customer_id,
right(first_name,2) as capital
from customers;
select customer_id,
substring(last_name,1,5) as sub_name
from customers;
select 
customer_id,
replace(email,'@gmail.com','@yahoo.com') as email_swap
from customers;
select
first_name
from customers
where first_name like '%A';
select
first_name
from customers
where first_name like 'A%';
select
last_name
from customers
where last_name like '%son';
select
first_name
from customers
where first_name like '%A%';
select *
from customers
where email like '%@gmail.com';
select * from customers 
where length(first_name) =5 ;
select  
 lower(trim(first_name))
 from customers;
select 
concat(first_name, ' ' , last_name) as combined_names
from customers;
select 
customer_id ,
upper(left(first_name,4))
from customers; 
select 
customer_id,
replace(first_name,' ', '_')
from customers;
select 
*
from customers
where first_name like 'S%' and last_name like '%a' ;
select 
customer_id,
SUBSTRING(email, INSTR(email, '@') + 1)
from customers;
select 
customer_id,
lower(right(last_name,3))
from customers;
select 
customer_id,
lower(left(last_name,3))
from customers;
select
customer_id,
right(email,4)
from customers;
select 
customer_id,
length(email) 
from customers;
select 
customer_id,
upper(concat(first_name ,' ' , last_name)) as FULL_NAME
from customers;
select 
customer_id,
replace(first_name,' ','')
from customers;
select 
customer_id,
lower(right(first_name,3))
from customers;
select
customer_id,
replace(email,'@','#')
from customers;
select 
customer_id,
length(concat(first_name,' ' ,last_name))
from customers;
select 
customer_id,
upper(SUBSTRING(email, INSTR(email, '@') + 1))
from customers;
