/*

Given the information about sales in a store, calculate the total revenue for each day, month, year, and product.

Notes
    - The sales table stores only the dates for which any data has been recorded - the information about individual
    sales (what was sold, and when) is stored in the sales_details table instead
    - The sales_details table stores totals per product per date
    - Order the result by the product_name, year, month, day columns
    - We're interested only in the product-specific data, so you shouldn't return the total revenue from all sales


Input tables
----------------------------------------
|    Table      |   Column   |  Type   |
|---------------+------------+---------|
| products      | id         | int     |
|               | name       | text    |
|               | price      | numeric |
|---------------+------------+---------|
| sales         | id         | int     |
|               | date       | date    |
|---------------+------------+---------|
| sales_details | id         | int     |
|               | sale_id    | int     |
|               | product_id | int     |
|               | count      | int     |
-----------------------------------------


Output table
--------------------------
|    Column    |  Type   |
|--------------+---------|
| product_name | text    |
| year         | int     |
| month        | int     |
| day          | int     |
| total        | numeric |
--------------------------


Example output
product_name | year | month | day | total
-------------+------+-------+-----+------
 milk        | 2019 | 01    | 01  | 200
 milk        | 2019 | 01    | 02  | 190
 milk        | 2019 | 01    |     | 390
 milk        | 2019 | 02    | 01  | 240
 milk        | 2019 | 02    |     | 240
 milk        | 2019 |       |     | 630
 milk        |      |       |     | 630



*/

WITH sales_info_enrichment AS(
  SELECT sales.id AS sales_id,
    EXTRACT(YEAR FROM sales.date::DATE)::INTEGER AS year,
    EXTRACT(MONTH FROM sales.date::DATE)::INTEGER AS month,
    EXTRACT(DAY FROM sales.date::DATE)::INTEGER AS day,
    sales_details.product_id,
    products.name,
    sales_details.count AS quantity,
    products.price
  FROM sales
  JOIN sales_details
    ON sales.id = sales_details.sale_id
  JOIN products
    ON sales_details.product_id = products.id
)
SELECT name AS product_name,
  year,
  month,
  day,
  quantity * price AS total
FROM sales_info_enrichment
ORDER BY product_name, year, month, day;