use marketplace_db ;
select 
*
from products 
where brand is not null;
select 
*
from products 
where brand is null;
select 
customer_id,
first_name,
date_of_birth
from customers 
where date_of_birth is null ;
select 
customer_id,
first_name,
date_of_birth
from customers 
where date_of_birth is not null ;
select 
product_id,
product_name,
coalesce(brand,'unknown_brand')
as brands
from products;
select 
product_id,
product_name,
coalesce(description,'no_description')
as brands
from products;
select 
product_id,
product_name,
coalesce(model_number, 'Not Assigned') as no_model_number 
from products;
select
product_id,
product_name,
ifnull(description,'Description Not Available')
from products;
select 
product_id,
product_name,
COALESCE(brand, model_number, 'Unknown Product Info') 
from products;
select 
seller_product_id ,
selling_price * COALESCE(discount_percentage, 0) / 100 as discount_percentage
from seller_products;
select
seller_product_id,
 COALESCE(discount_percentage, 0) as discount_percentqge
 from seller_products;
 select 
 seller_product_id,
 nullif(discount_percentage,0) as percentages
 from seller_products;
 select 
 count(*),
 count(discount_percentage)
 from seller_products;
  select 
 count(*) - count(discount_percentage) as No_Discount_Percentage
 from seller_products;
 select count(*) as products_not_missing_model_numbers 
 from products
 where model_number is not null;
 select 
 seller_product_id,
 selling_price * COALESCE(discount_percentage, 0) / 100 as discount_amount
 from seller_products;
 select  
  sum(discount_percentage) as total_discount_percentage
 from seller_products ;
 select  
avg(discount_percentage) as total_discount_percentage
 from seller_products ;
 select 
 product_id,
 product_name,
 case 
 when brand is null then 'brand_missing'
 else 'brand_available'
 end as  brand
 from products;
  select 
 product_id,
 product_name,
 case 
 when description is null then 'description_missing'
 else 'description_available'
 end as  brand
 from products;
   select 
 product_id,
 product_name,
 case 
 when model_number is null then 'No_Model'
 else 'Model_available'
 end as  brand
 from products;
 select 
  product_id,
 product_name,
 case 
 when brand is null then 'No_Brand'
 when brand = 'Samsung' then 'Samsung_product'
 else 'other_brand'
 end as brands_category
from products;
select 
 product_id,
 product_name,
 case 
 when brand is not null and model_number is not null 
 then 'Complete Info'
 else 'Incomplete Info'
 end as details 
 from products;
select 
 product_id,
 product_name,
 case 
 when brand is  null and model_number is  null 
 then 'Needs Information'
 else 'Information Complete'
 end as info_status
 from products;
 select 
 product_id,
 product_name,
 case 
 when brand is  null or model_number is  null 
 then 'Needs Information'
 else 'Information Complete'
 end as info_status
 from products;
 select
 count(*)
 from products 
 where brand is null;
  select
 count(
 case 
 when brand is null or model_number is null
 then 'Needs Information'
 else 'Information Complete'
 end as info_status )
 from products ;
 select
 count(*)
 from products
 where brand is null or model_number is null 
 ;
 select 
 product_id,
 product_name,
 brand,
 model_number
  from products
 where brand is null and model_number is null ;
