-- Using a CTE, calculate total revenue for each customer and display the top 10 customers by revenue.
with cte_total_revenue as(
	select customer_name, sum(total_sales) as total_revenue
	from global_ecommerce_sales
	group by customer_name)
select customer_name, total_revenue from cte_total_revenue
order by total_revenue desc 
limit 10
-- ----------------------------------------------------


-- Using a CTE, calculate total revenue by category and identify the highest-revenue category.
with cte_total_rev as( 
	select product_category, sum(total_sales) as total_rev
	from global_ecommerce_sales
	group by product_category)
select product_category, total_rev
from cte_total_rev
order by  total_rev desc 
limit 1
-- ---------------------------------------------------------


-- Using a CTE, calculate monthly revenue and identify the month with the highest revenue.
with cte_monthly_rev as( 
	select year(order_date) as year, month(order_date) as month, sum(total_sales) as total_rev
	from global_ecommerce_sales
	group by year, month)
select year, month, total_rev
from cte_monthly_rev
order by  total_rev desc 
limit 1
-- ---------------------------------------------------------------


-- Find the top 3 products from each category based on revenue.
with cte as(
		select product_name,product_category, sum(total_sales) as total_revenue
	 	from global_ecommerce_sales
		group by product_category, product_name
	),
	ranked as(
	    select product_category, product_name, total_revenue,
	    rank() over(
		partition by product_category
	    order by total_revenue desc)
	 	as ranking
	    from cte
	)
select product_name,product_category, total_revenue, ranking
from ranked
where ranking<=3
order by product_category, ranking
-- -----------------------------------------------------------------


-- Rank products within each category based on total profit using DENSE_RANK().
with cte as(
	select product_name, product_category, sum(profit) as total_profit
	from global_ecommerce_sales
	group by product_category,product_name
	)
select product_name, product_category,total_profit,
dense_rank() over(
	partition by  product_category
	order by total_profit desc) as ranking
from cte
-- ------------------------------------------------------------------


-- Find the top 3 customers within each customer segment based on total revenue.
with cte as(
	select customer_name, customer_segment, sum(total_sales) as total_rev
	from global_ecommerce_sales
	group by customer_name, customer_segment
	),
ranked_customer as(
	select customer_name, customer_segment, total_rev,
	dense_rank() over(
		partition by customer_segment
		order by total_rev desc) as ranking 
		from cte
	)
select customer_name, customer_segment, total_rev, ranking
from ranked_customer
where ranking<4

