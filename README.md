# Global E-Commerce Sales: SQL Analysis

SQL project analyzing sales, customers, and products of a global e-commerce business (2023-2025).
Dataset: [Global E-Commerce Sales & Customer Analytics (Kaggle)](https://www.kaggle.com/code/muhammadaammartufail/global-e-commerce-sales-customer-analytics/notebook)

## Tools
MySQL

## SQL Concepts Used
- Aggregations, GROUP BY, HAVING
- CASE WHEN
- Date functions (YEAR, MONTH)
- Subqueries
- CTEs
- Window functions (RANK, DENSE_RANK, LAG, running totals)

## Project Structure
| File | Description |
|------|-------------|
| 01_data_understanding.sql | Orders, customers, products, total revenue |
| 02_segment_region_category.sql | Revenue by segment, region, category, country |
| 03_case_when_date_analysis.sql | Profit/quantity/price classification, yearly and monthly revenue |
| 04_customer_product_analysis.sql | Top customers/products, above-average analysis |
| 05_cte_window_functions.sql | Top-N per group using CTEs and ranking |
| 06_running_total_growth.sql | Running total, % contribution, MoM and YoY growth |
| 07_business_questions.sql | Profit margin, product/region insights, category growth |

## How to Run
1. Download the dataset from Kaggle and import it into MySQL as `global_ecommerce_sales`.
2. Run the files in order from the `sql/` folder.

## Key Insights

**Overall**
- 2,000 orders from 1,534 unique customers across 40 products, generating $484,559 in total revenue.

**Category**
- Furniture dominates with $256,275 (52.9% of revenue), followed by Technology $139,518 (28.8%) and Clothing & Accessories $69,376 (14.3%).
- Office Supplies is the weakest at $19,391 (4.0%).
- Over 2023-2025, Clothing & Accessories grew the most (+19.7%), while Furniture, the largest category, declined 7.1% (it fell 16.3% in 2024 and recovered 11.0% in 2025).

**Customer Segment**
- Consumer: $256,288 (52.9%), Corporate: $146,050 (30.1%), Home Office: $82,221 (17.0%).

**Region & Country**
- Europe leads ($137,006, 28.3%), closely followed by North America ($133,876, 27.6%) and Asia Pacific ($121,708, 25.1%).
- South America and Middle East & Africa are far behind (~$46K each, ~9.5% each).
- North America has the highest profit margin at 33.8% ($45,250 profit).
- Mexico is the top country ($47,217), then Canada ($45,327) and the United States ($41,333).
- The best Region + Category combination is Furniture in Europe ($77,277), about 16% of total revenue.

**Time Trend**
- Yearly revenue: 2023 $164,443, 2024 $155,151 (-5.65% YoY), 2025 $164,965 (+6.33% YoY).
- Revenue is essentially flat over three years (2025 is only ~0.3% above 2023), so the business is stable rather than growing.
- Best month overall: June 2025 with $18,068.
- Monthly revenue is highly volatile. Largest MoM jump: April 2025 (+111%, from $7,772 to $16,404). Largest MoM drop: November 2023 (-52.4%, from $17,795 to $8,475).
- October is consistently strong: $17,795 (2023), $17,426 (2024), $15,875 (2025).

**Products**
- Top 3 by revenue: Standing Desk Converter ($46,614), Ergonomic Office Chair ($45,405), Corner L-Shaped Desk ($41,070).
- The top 10 products generate $301,179, or 62.2% of total revenue, so product revenue is heavily concentrated.
- The most profitable products are Ergonomic Office Chair ($15,105), Standing Desk Converter ($14,694) and Corner L-Shaped Desk ($13,663).
- Most above-average revenue products are also top-10 performers (mostly Furniture and Technology).

**Customers**
- Average customer spend is about $316.
- The top customer (Priya Jackson) spent $3,836, roughly 12x the average.
- The top 10 customers contribute only 6.35% of revenue ($30,773), so customer concentration is low, unlike products (62.2%).

## Business Takeaways
- Revenue depends on a small set of Furniture and Technology products, so stock or supply problems there would hurt a lot.
- Customer risk is low because no single customer matters much.
- Growth is flat. Clothing & Accessories is the most promising growing category, and Furniture in Europe is the strongest market segment.
- High month-to-month swings suggest seasonality or promotions worth investigating, especially the weak February to March period and strong October.