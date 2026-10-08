
-- How many total orders are there?
select count(order_id) as total_orders from global_ecommerce_sales
-- -------------------------------------------------------------------

-- How many unique customers are there?
select count(distinct customer_name) as total_unique_customes from global_ecommerce_sales
-- ------------------------------------------------------------------------------------------

-- How many unique products are there?
select count(distinct product_name) as total_unique_product from global_ecommerce_sales
-- --------------------------------------------------------------------------------------==

-- What is the total revenue generated?
select sum(total_sales) as total_revenue from global_ecommerce_sales 
-- --------------------------------------------------------------------