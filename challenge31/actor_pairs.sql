/*
  Given the the schema presented below find two actors who cast together the most and
  list titles of only those movies they were casting together. Order the result set
  alphabetically by the movie title.

  Table film_actor:

    Column      | Type                        | Modifiers
    ------------+-----------------------------+----------
    actor_id    | smallint                    | not null
    film_id     | smallint                    | not null
    ...

  Table actor:

    Column      | Type                        | Modifiers
    ------------+-----------------------------+----------
    actor_id    | integer                     | not null
    first_name  | character varying(45)       | not null
    last_name   | character varying(45)       | not null
    ...

  Table film:

    Column      | Type                        | Modifiers
    ------------+-----------------------------+----------
    film_id     | integer                     | not null
    title       | character varying(255)      | not null
    ...

  The desired output:

    first_actor | second_actor | title
    ------------+--------------+--------------------
    John Doe    | Jane Doe     | The Best Movie Ever
    ...

  - first_actor - Full name (First name + Last name separated by a space)
  - second_actor - Full name (First name + Last name separated by a space)
  - title - Movie title

  Note: actor_id of the first_actor should be lower then actor_id of the second_actor
*/


WITH actor_pairs AS (
  SELECT a.film_id,
    a.actor_id AS first_actor_id,
    b.actor_id AS second_actor_id
  FROM film_actor AS a
  JOIN film_actor AS b
    ON a.film_id = b.film_id
  WHERE a.actor_id <> b.actor_id
  ORDER BY a.film_id, a.actor_id, b.actor_id
),


most_rated_actor_pair AS (
  SELECT
    first_actor_id,
    second_actor_id,
    ARRAY_AGG(f.title) AS titles,
    COUNT(f.film_id) AS total_common_films
  FROM actor_pairs AS pairs
  JOIN film AS f
    ON f.film_id = pairs.film_id
  GROUP BY first_actor_id, second_actor_id
  ORDER BY total_common_films DESC
  LIMIT 1
),

flatten_film_titles AS (
  SELECT first_actor_id,
    second_actor_id,
    UNNEST(titles) AS film_title
  FROM most_rated_actor_pair

),

enriched_with_names AS (
  SELECT
    fa.first_name || ' ' || fa.last_name AS first_actor,
    fb.first_name || ' ' || fb.last_name AS second_actor,
    film_title AS title
  FROM flatten_film_titles AS f
  JOIN actor AS fa
    ON f.first_actor_id = fa.actor_id
  JOIN actor AS fb
    ON f.second_actor_id = fb.actor_id
  ORDER BY title ASC
)

SELECT *
FROM enriched_with_names
