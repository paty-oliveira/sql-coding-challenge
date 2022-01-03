/*
For this challenge you need to PIVOT data. You have two tables, products and details.
Your task is to pivot the rows in products to produce a table of products which have rows of their detail.
Group and Order by the name of the Product.

You must use the CROSSTAB statement to create a table that has the schema as below:

CROSSTAB table.
    name
    good
    ok
    bad
*/


SELECT *
FROM CROSSTAB(
    'SELECT prod.name, det.detail, COUNT(1)::BIGINT AS total
    FROM products AS prod
    JOIN details AS det
      ON prod.id = det.product_id
    GROUP BY prod.name, det.detail
    ORDER BY prod.name'
) AS final_result(name TEXT, good BIGINT, ok BIGINT, bad BIGINT);
