-- Which region has the highest profit margin?
select region, sum(profit) as total_profit, sum(total_sales) as total_revenue,
sum(profit)/sum(total_sales)*100 as profit_margin
from global_ecommerce_sales
group by region
order by  profit_margin desc
limit 1
-- ----------------------------------------------


-- What percentage of total revenue comes from the top 10 products?
	with cte as(
	select product_name, sum(total_sales) as product_rev
	from global_ecommerce_sales
	group by product_name
	),
top10 as( 
	select product_name,  product_rev
	from cte
	order by product_rev desc
	limit 10
	)
select 
sum(product_rev) as top10_revenue,
(select sum(product_rev) from cte) as total_revenue,
sum(product_rev)/(select sum(product_rev) from cte)*100 as percentage
from top10
-- ------------------------------------------------------------------------


-- For each category, identify the highest-revenue product.
with cte as (
	select product_category,product_name ,
	sum(total_sales) as p_rev
	from global_ecommerce_sales
	group by product_category,product_name 
	),
ranked as( 
	select product_category,product_name ,p_rev,
	rank() over(
		partition by  product_category
		order by p_rev desc) as ranking 
	from cte
	)
select product_category,product_name, ranking
from ranked 
where ranking=1
-- ----------------------------------------------------------------------


-- For each region, identify the highest-revenue country.
with cte as(
	select region ,country ,sum(total_sales) as country_rev
	from global_ecommerce_sales
	group by region ,country),

ranked as(
	select region ,country,country_rev,
	rank() over( 
		partition by region
		order by country_rev desc)as ranking
	from cte)
select region ,country,country_rev,ranking
from ranked 
where ranking=1
-- --------------------------------------------------------------------------


-- Find products that have high sales quantity but below-average revenue.
with cte as(
    select product_name, sum(quantity) as total_quantity, sum(total_sales ) as total_rev
	from global_ecommerce_sales
	group by product_name
	)
select product_name  ,total_quantity,total_rev
from cte global_ecommerce_sales 
where total_quantity> (select avg(total_quantity) from cte )
	and total_rev< (select avg(total_rev) from cte )
order by total_quantity desc
-- -----------------------------------------------------------------


-- Find products that have high revenue but below-average quantity sold.
with cte as(
	select product_name, sum(quantity) as total_quantity, sum(total_sales ) as total_rev
	from global_ecommerce_sales
	group by product_name
	)
select product_name  ,total_quantity,total_rev
from cte global_ecommerce_sales 
where total_quantity< (select avg(total_quantity) from cte )
	and total_rev> (select avg(total_rev) from cte )
order by total_rev desc
-- -----------------------------------------------------------------------


-- Find the category whose revenue is growing the fastest over time.
with cte as(
    select year(order_date) AS year,product_category,
    sum(total_sales)as revenue
    from global_ecommerce_sales
    group by year, product_category
    ),
cte2 as( 
	select product_category , year, revenue,
	lag(revenue) over(
		partition by product_category
		order by year) as previous_revenue
	from cte
	)
select product_category , year, revenue,previous_revenue,
round((revenue - previous_revenue) / previous_revenue * 100,2) as growth_pct
from cte2
where previous_revenue is not null
order by growth_pct desc;
-- --------------------------------------------------------------------------


-- Identify the best-performing combination of Region + Category based on total revenue.
select product_category,region,sum(total_sales ) as total_rev
from global_ecommerce_sales
group by  product_category,region
order by total_rev desc
limit 1
