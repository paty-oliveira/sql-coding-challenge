/*

In the task, you need to calculate whether a Pareto principle is observed for a DVD rentals,
which states that 20% of customers will be responsible for approximately 80% of the rentals.
You need to write a query that would identify the top 20% of customers based on the number of
rentals they had made, and then calculate the percentage of total rentals they accounted for.

In the task you need to:
- calculate the total number of rentals across all customers.
- identify the top 20% of customers by rentals.
- calculate the number of rentals by these top 20% of customers.
- Finally, to calculate the percentage of rentals by the top 20% of customers compared to the total number of rentals.


In your query you need to return three pieces of information:
- top_20_rentals_count: The total number of rentals made by the top 20% of customers.
- total_rentals_count: The total number of rentals made by all customers.
- percentage_of_top_20: The percentage of total rentals made by the top 20% of customers.
Should be of numeric type, rounded to 2 decimal places

Schema
(not all columns - only part of the domain required to solve this kata)

- customer table:
    Column       | Type     | Modifiers
    ------------ +----------+----------
    customer_id  | integer  | not null
    first_name   | varchar  | not null
    last_name    | varchar  | not null

- rental table:
    Column       | Type      | Modifiers
    -------------+-----------+----------
    rental_id    | integer   | not null
    customer_id  | integer   | not null

Desired Output

The desired output should look like this:

    top_20_rentals_count| total_rentals_count  | percentage_of_top_20
    ---------------------+----------------------+--------------------------+
    7756                 | 10000                |   0.776e2                |
*/


WITH rentals_by_customers AS (
  SELECT
    customer_id,
    count(rental_id) AS total_rentals
  FROM rental
  GROUP BY customer_id
),

ranked_customers AS (
  SELECT
    customer_id,
    total_rentals,
    PERCENT_RANK() OVER (ORDER BY total_rentals DESC) AS percent_ranked
  FROM rentals_by_customers
)

SELECT
  SUM(total_rentals) FILTER (WHERE percent_ranked <= 0.20)::INTEGER AS top_20_rentals_count,
  SUM(total_rentals)::INTEGER AS total_rentals_count,
  ROUND(SUM(total_rentals) FILTER (WHERE percent_ranked <= 0.20)
    / SUM(total_rentals), 4) AS percentage_of_top_20
FROM ranked_customers
