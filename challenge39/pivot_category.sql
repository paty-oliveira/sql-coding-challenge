/*
    For this challenge you need to PIVOT data. You have two tables, products and details.
    Your task is to pivot the rows in products to produce a table of products which have rows of
    their detail. Group and Order by the name of the Product.

    products table schema:
        - id   - integer
        - name - text

    details table schema:
        - id          - integer
        - product_id  - integer
        - detail      - text

    You must use the CROSSTAB statement to create a table that has the schema as below:

    CROSSTAB table schema
        - name  - text
        - bad   - bigint
        - good  - bigint
        - ok    - bigint
*/

CREATE EXTENSION tablefunc;

SELECT *
FROM crosstab(
  $$
  SELECT
    prod.name AS name,
    det.detail AS category,
    count(1) AS total
  FROM products AS prod
  JOIN details AS det
    ON prod.id = det.product_id
  GROUP BY 1, 2
  ORDER BY name, category
  $$,
  $$
  SELECT unnest(ARRAY['good', 'ok', 'bad'])
  $$
) AS ct(name TEXT, good BIGINT, ok BIGINT, bad BIGINT);
