use marketplace_db;
select * from customers 
where gender = 'male';
select * from orders 
where total_amount > 50000;
select * from customers 
where account_status = 'active';
select * from products 
where weight < 2;
select * from sellers 
where seller_rating >= 4.5;
select * from products
where weight <=1; 
select * from customers 
where account_status != 'suspended';
select * from customers 
where gender = 'male' and account_status = 'active' ;
select * from orders 
where total_amount > 50000 and payment_status = 'paid';
select * from customers 
where gender = 'male' or  gender = 'female' ; 
select * from products 
where brand = 'apple' or brand = 'samsung' ;
select * from orders
where total_amount > 50000 and (payment_status = 'paid' or payment_status = 'pending');
select * from customers 
where account_status != 'suspended' and gender = 'male' ;
select * from orders 
where total_amount > 50000 or (payment_status = 'failed' and total_amount > 10000);
select * from orders 
where total_amount between 10000 and 50000 ;
select * from products
where weight between 1 and 5 ;
select * from products
where brand not in ('apple','samsung','sony');
select * from products
where product_name like '%a%' ;
select * from products
where product_name  like 'A%' or product_name  like  'S%';
select * from products 
where product_name like '%r' or product_name like '%e';
select * from customers
where account_status not in ('active' , 'inactive');
select * from orders 
where total_amount between 20000 and 80000 and payment_status = 'paid';
select * from products 
where description is not null ;
select * from products 
where description is  null and weight < 2 ;
select * from customers 
where email is not null or phone_number is not null ;
select * from customers 
where email is not null and phone_number is not null ;
select * from sellers 
where seller_rating between 3 and 5 and seller_rating is not null ;
select * from orders 
where total_amount > 50000 and (payment_status = 'paid' or payment_status = 'pending');
select * from orders 
where (payment_status = 'paid' or payment_status ='pending') and (total_amount between 10000 and 50000);
select * from customers
where account_status = 'active'and gender in ('male','female');
select * from products 
where brand in ('apple','samsung','sony') and weight between 1 and 5 ;
select * from orders where total_amount not between 10000 and 50000
and payment_status != 'failed';
select * from customers 
where account_status !='suspended'
 and gender ='male';
 select * from sellers 
 where seller_rating >= 4 or seller_rating is null;
 select * from products 
 where weight < 2 or weight is null ;
 select * from products 
 where brand not in ('apple','samsung','sony') and weight is not null ;
 select * from orders 
 where(payment_status ='paid' or payment_status ='pending')
 and(total_amount > 50000 or total_amount < 10000);
 select * from customers 
 where gender = 'male' and ( account_status = 'active' or account_status = 'inactive');
 select * from products
 where product_name like'A%'
 and brand in ('samsung' , 'apple')
 and weight is not null ;
 select * from orders 
 where total_amount between 20000 and 80000 
 and payment_status != 'failed'  and payment_status is not null ;
 select * from customers 
 where first_name like'A%' and(account_status = 'active' or gender = 'male' );
 select * from products 
 where product_name like '%phone%' and weight between 1 and 3 
 and brand != 'apple' ;
 select * from sellers 
 where seller_rating between 4 and 5 and(business_name like 'S%' or business_name like '%e');
 select * from customers 
 where first_name like '%a%' and email is not null and account_status != 'suspended' ;  
 select * from orders 
 where total_amount > 30000 and payment_status = 'paid' or payment_status = 'pending' 
 and total_amount is not null ;  -- and has more power then or so whenever we use and if or is there then use in operator for writing the query --
 select * from products 
 where(product_name like 'S%' OR brand = 'apple')and weight < 5 ;
select*from customers
where first_name like '%n'
and account_status in('active' , 'pending') and email is not null ;
select * from products 
where(product_name  like 'A%' OR product_name  like '%r' )
and brand  not in ('apple','samsung')
and weight >= 2 ;
select * from orders 
where(total_amount between 30000 and 100000 )and(payment_status in ('paid' , 'pending' ))or payment_status is null ;
select * from orders 
where(total_amount between 30000 and 100000) and payment_status in('paid' , 'pending' ) or payment_status is null ;
SELECT *
FROM orders
WHERE total_amount BETWEEN 30000 AND 100000
  AND (
      payment_status IN ('paid', 'pending')
      OR payment_status IS NULL
  ); 
select * from products 
where weight between 2 and 10 
and description is not null 
and brand in ('apple','samsung');
select * from sellers 
where seller_rating is not null 
and(seller_rating >= 4.5 or business_name like 'A%');
select * from customers 
where first_name like 'S%' AND email is not null and account_status in ('active','inactive') and gender != 'male' ;
select * from products
where product_name like '%pro%'
and brand in ('apple' , 'samsung' , 'sony' ) and weight not between 1 and 5 
and description is not null ;
select * from orders 
where(total_amount > 50000 or total_amount < 10000)
and payment_status != 'failed' 
and payment_status is not null ;
select * from customers 
where first_name like 'A%' or first_name like '%n' 
and account_status != 'suspended' 
and email is not null ; 
select * from products 
where product_name like 'S%'
AND brand IN ('apple' , 'samsung')
AND(weight < 2 OR weight > 8 );
SELECT * FROM customers
where first_name like 'a%'
and account_status in ('active' , 'inactive')
and(gender = 'male'  or gender is not null )
and phone_number is not null ;
select * from orders 
where total_amount between 20000 and 70000
and payment_status in ('paid' , 'pending' ) 
and payment_status is not null 
and total_amount is not null ;
select * from products 
where (  product_name like 'M%' OR   product_name   like '%PHONE%' )
and brand != 'apple' 
and ( weight between 1 and 5 or weight is  null )  ;
 select * from sellers 
 where  ( business_name like 'a%' or business_name like '%z' )
 and seller_rating between 3 and 5 
 and seller_rating is not null ;
 select * from orders 
 where total_amount not between 10000 and 50000
 and payment_status in ('paid' , 'pending') 
 and total_amount is not null ;
 select * from customers
 where first_name like 'R%' or first_name like  '%a%'
 and account_status != 'suspended'
 and  (  email is not null or phone_number is  not null ) ;
 select * from products 
 where brand in ('apple' , 'samsung' , 'sony' ) 
 and ( product_name like 'S%' OR product_name like '%r' )
 and description is not null 
 and weight is not null ;
 select * from orders 
 where total_amount > 25000 
 and ( payment_status in ('paid' , 'pending' ) or payment_status is null )
 and total_amount is not null ;
 select * from customers 
 where  ( first_name like 'S%' or first_name like '%a' )
 and ( gender = 'female' or gender is null )
 and account_status != 'suspended' 
 and email is not null ;
 select * from products 
 where ( product_name like '%phone%' or product_name like 'A%' )
 and brand  not in  ('apple','sony' )
 and ( weight between 2 and 8 or weight is null )
 and description is not null ;
 
