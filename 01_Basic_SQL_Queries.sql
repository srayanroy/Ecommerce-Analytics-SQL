use marketplace_db;
select * from customers ;
select first_name , last_name , email from customers;
select product_name,brand from products;
select  first_name CustomerName , 
last_name  Surname , 
email  EmailAddress 
from customers ;
select distinct gender from customers;
select distinct city , state from seller_addresses;
select * from customers
order by first_name;
select * from orders
order by  total_amount desc;
select * from sellers 
order by seller_rating desc , owner_name asc ;
select * from customers 
limit  5;
select * from sellers 
order by seller_rating desc
limit 1,1;
select * from products 
order by weight desc 
limit 5;
