-- Find customers whose total spending is higher than the overall average customer spending.
select customer_name, sum(total_sales) as total_spending
from global_ecommerce_sales
group by customer_name
having total_spending>
	(
	select  avg(customer_sales) 
	from ( select customer_name, sum(total_sales) as customer_sales
		from  global_ecommerce_sales
		group by customer_name) as average_spending
	)
order by total_spending desc;
-- ---------------------------------------------------------


-- Find the top 10 products by total revenue.
select product_name, sum(total_sales) as total_revenue
from global_ecommerce_sales
group by product_name
order by total_revenue desc
limit 10
-- -----------------------------------------------------------


-- Find products whose total revenue is greater than the average product revenue.
select product_name, sum(total_sales)as total_revenue
from  global_ecommerce_sales
group by product_name
having total_revenue>
	( 
	select avg(product_revenue)as average_revenue
	from (select product_name, sum(total_sales) as product_revenue
		from global_ecommerce_sales
		group by product_name) as average_product_revenue
	)
-- -------------------------------------------------------------


-- Find the top 10 most profitable products.
select product_name, sum(profit) as total_profit
from global_ecommerce_sales
group by product_name
order by total_profit desc
limit 10
-- ---------------------------------------------------------------


-- Find the country that generated the highest total revenue using a subquery.
select country, sum(total_sales) as total_revenue 
from global_ecommerce_sales
group by country 
having total_revenue=
	( 
	select max(country_revenue) as avg_p_revenue
	from (select country, sum(total_sales) as country_revenue
    		from global_ecommerce_sales
		 	group by country) as country_totals
	)
