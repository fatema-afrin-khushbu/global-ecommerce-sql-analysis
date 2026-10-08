-- Calculate the cumulative/running revenue over time.
with cte as(
	select order_date,
	sum(total_sales) as dailyrev
	from global_ecommerce_sales
	group by order_date
	)
select order_date, dailyrev,
sum(dailyrev) over( order by order_date) as runningrev
from cte
-- -----------------------------------------------------------


-- Calculate each category's percentage contribution to total revenue.
with cte as(
	select product_category, sum(total_sales) as category_rev
	from global_ecommerce_sales
	group by product_category
    )
select product_category, category_rev,
category_rev/sum(category_rev) over() *100 as percentage
from cte
-- ---------------------------------------------------------------------


-- Find what percentage of total revenue comes from the top 10 customers.
with cte as(
	select customer_name, sum(total_sales) as c_rev
	from global_ecommerce_sales
	group by customer_name
	),
top10 as(
	select customer_name,c_rev 
	from cte
	order by c_rev desc
	limit 10
	)
select 
sum(c_rev) as top10rev,
(select sum(total_sales) from global_ecommerce_sales),
round(sum(c_rev) /(select sum(total_sales) from global_ecommerce_sales) * 100,2)as prev
from top10
-- ----------------------------------------------------------------------------------------


-- Calculate the month-over-month (MoM) revenue growth percentage.
with cte as(
	select month(order_date) as month, year(order_date) as year,
	sum(total_sales) as revenue
	from global_ecommerce_sales
	group by year, month
	),
	cte2 as(
	 select month,year,revenue,
	 lag(revenue) over(order by year, month) as previous_revenue
	 from cte
	 )
 select year ,month,revenue,previous_revenue,
 round((revenue-previous_revenue)/previous_revenue*100,2) as mom_growth
 from cte2
 order by year,month
-- ------------------------------------------------------------------------------


-- Identify the month with the highest positive MoM growth.
with cte as(
	select month(order_date) as month, year(order_date) as year,
	sum(total_sales) as revenue
	from global_ecommerce_sales
	group by year, month
	),
 cte2 as(
	 select month,year,revenue,
	 lag(revenue) over(order by year, month) as previous_revenue
	 from cte
	 )
 select year ,month,revenue,previous_revenue,
 round((revenue-previous_revenue)/previous_revenue*100,2) as mom_growth
 from cte2
 where previous_revenue is not null
 order by mom_growth desc
 limit 1
-- --------------------------------------------------------------------------------


-- Identify the month with the largest decline in revenue compared with the previous month.
with cte as(
	select month(order_date) as month, year(order_date) as year,
	sum(total_sales) as revenue
	from global_ecommerce_sales
	group by year, month
	),
 cte2 as(
	 select month,year,revenue,
	 lag(revenue) over(order by year, month) as previous_revenue
	 from cte
	 )
 select year ,month,revenue,previous_revenue,
 round((revenue-previous_revenue)/previous_revenue*100,2) as mom_growth
 from cte2
 where previous_revenue is not null
 order by mom_growth asc
 limit 1
-- ----------------------------------------------------------------------------


-- Calculate year-over-year (YoY) revenue growth.
with cte as(
	select year(order_date) as year,
	sum(total_sales) as revenue
	from global_ecommerce_sales
	group by year
	),
 cte2 as(
	 select year,revenue,
	 lag(revenue) over(order by year) as previous_revenue
	 from cte
	 )
 select year ,revenue,previous_revenue,
 round((revenue-previous_revenue)/previous_revenue*100,2) as yoy_growth
 from cte2
 order by yoy_growth desc