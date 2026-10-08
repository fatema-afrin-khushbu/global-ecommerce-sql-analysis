# Global E-Commerce Sales: SQL Analysis

SQL project analyzing **sales, customers, and products** of a global e-commerce business from **2023–2025**.

## Project Overview

This project analyzes **2023–2025 global e-commerce sales data** using MySQL to uncover trends in **revenue, profitability, customer segments, products, categories, and regional performance**. It applies SQL techniques ranging from basic aggregations to **CTEs and window functions** to identify top-performing products and customers, measure growth, and answer key business questions.

**Dataset:** [Global E-Commerce Sales & Customer Analytics — Kaggle](https://www.kaggle.com/code/muhammadaammartufail/global-e-commerce-sales-customer-analytics/notebook)

## Tools

* MySQL

## SQL Concepts Used

* Aggregations, `GROUP BY`, `HAVING`
* `CASE WHEN`
* Date functions (`YEAR`, `MONTH`)
* Subqueries
* CTEs
* Window functions:

  * `RANK()`
  * `DENSE_RANK()`
  * `LAG()`
  * Running totals

## Project Structure

| **File**                           | **Description**                                                  |
| ---------------------------------- | ---------------------------------------------------------------- |
| `01_data_understanding.sql`        | Orders, customers, products, and total revenue                   |
| `02_segment_region_category.sql`   | Revenue by segment, region, category, and country                |
| `03_case_when_date_analysis.sql`   | Profit/quantity/price classification, yearly and monthly revenue |
| `04_customer_product_analysis.sql` | Top customers/products and above-average analysis                |
| `05_cte_window_functions.sql`      | Top-N per group using CTEs and ranking                           |
| `06_running_total_growth.sql`      | Running total, % contribution, MoM and YoY growth                |
| `07_business_questions.sql`        | Profit margin, product/region insights, and category growth      |

## How to Run

1. Download the dataset from Kaggle and import it into MySQL as `global_ecommerce_sales`.
2. Run the SQL files in order from the `sql/` folder.

## Key Insights

### Overall

* **2,000 orders** from **1,534 unique customers** across **40 products**, generating **$484,559** in total revenue.

### Category

* **Furniture** dominates with **$256,275 (52.9%)** of revenue, followed by **Technology $139,518 (28.8%)** and **Clothing & Accessories $69,376 (14.3%)**.
* **Office Supplies** is the weakest category at **$19,391 (4.0%)**.
* Over 2023–2025, **Clothing & Accessories** grew the most (**+19.7%**), while Furniture, the largest category, declined **7.1%**. Furniture fell **16.3% in 2024** and recovered **11.0% in 2025**.

### Customer Segment

* **Consumer:** $256,288 (52.9%)
* **Corporate:** $146,050 (30.1%)
* **Home Office:** $82,221 (17.0%)

### Region & Country

* **Europe** leads with **$137,006 (28.3%)**, closely followed by **North America $133,876 (27.6%)** and **Asia Pacific $121,708 (25.1%)**.
* **South America** and **Middle East & Africa** are far behind at approximately **$46K each (~9.5% each)**.
* **North America** has the highest profit margin at **33.8%**, with **$45,250 profit**.
* **Mexico** is the top country with **$47,217**, followed by **Canada $45,327** and **the United States $41,333**.
* The best **Region + Category** combination is **Furniture in Europe ($77,277)**, representing about **16% of total revenue**.

### Time Trend

* **2023:** $164,443
* **2024:** $155,151 (**-5.65% YoY**)
* **2025:** $164,965 (**+6.33% YoY**)
* Revenue is essentially flat over three years, with 2025 only approximately **0.3% above 2023**, indicating that the business is stable rather than experiencing significant growth.
* The best month overall was **June 2025**, with **$18,068** in revenue.
* Monthly revenue was highly volatile. The largest MoM increase was **April 2025 (+111%)**, from $7,772 to $16,404.
* The largest MoM decline was **November 2023 (-52.4%)**, from $17,795 to $8,475.
* **October** was consistently strong: $17,795 (2023), $17,426 (2024), and $15,875 (2025).

### Products

* Top 3 products by revenue:

  1. **Standing Desk Converter — $46,614**
  2. **Ergonomic Office Chair — $45,405**
  3. **Corner L-Shaped Desk — $41,070**
* The **top 10 products generated $301,179 (62.2%)** of total revenue, indicating high product-level revenue concentration.
* The most profitable products were:

  * **Ergonomic Office Chair — $15,105**
  * **Standing Desk Converter — $14,694**
  * **Corner L-Shaped Desk — $13,663**
* Most above-average revenue products were also top-10 performers, mainly from **Furniture and Technology**.

### Customers

* Average customer spend was approximately **$316**.
* The top customer, **Priya Jackson**, spent **$3,836**, roughly **12× the average**.
* The **top 10 customers contributed only 6.35% of total revenue ($30,773)**, indicating low customer concentration compared with product concentration.

## Business Takeaways

* Revenue depends heavily on a small set of **Furniture and Technology products**, so stock or supply problems in these products could significantly affect revenue.
* **Customer risk is low** because no single customer contributes a large share of revenue.
* Overall growth is relatively flat. **Clothing & Accessories** is the most promising growing category, while **Furniture in Europe** is the strongest market segment.
* High month-to-month fluctuations suggest possible **seasonality or promotional effects**, particularly around the weak February–March period and strong October performance.
