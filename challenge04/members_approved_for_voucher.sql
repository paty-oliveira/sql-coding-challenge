/*
For this challenge is necessary to create a query
to give out vouches to members who have spent over 
$1000 in departments that have brought in more than
$10000 total ordered by the members id.
*/

WITH most_lucrative_departments AS (
    SELECT d.id, 
        d.name, 
        SUM(p.price) total_sales
    FROM sales s
    JOIN departments d
        ON s.department_id = d.id
    JOIN products p
        ON s.product_id = p.id
    GROUP BY d.id, d.name
    HAVING SUM(p.price) > 10000
)
SELECT s.member_id id, 
    m.name, 
    m.email, 
    SUM(p.price) total_spending
FROM sales s
JOIN products p
    ON s.product_id = p.id
JOIN members m
    ON s.member_id = m.id
JOIN most_lucrative_departments d
    ON s.department_id = d.id
GROUP BY s.member_id, m.name, m.email
HAVING SUM(p.price) > 1000
ORDER BY s.member_id;