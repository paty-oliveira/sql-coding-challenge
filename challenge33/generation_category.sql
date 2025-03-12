/*
    Assume you have a PostgreSQL database with a table named "users". The "users" table has
    the following columns:

    - id (integer): a unique identifier for each user.
    - name (text): the name of the user.
    - birthdate (date): the user's birth date.

    The generational categories are generally defined as follows:
        - Generation Z: Born from 1997 to 2012 (inclusive)
        - Millennials: Born from 1981 to 1996
        - Generation X: Born from 1965 to 1980
        - Baby Boomers: Born from 1946 to 1964
        - Silent Generation: Born from 1928 to 1945
        - Greatest Generation: Born in 1927 or earlier

    Your SQL query should return all users sorted by id in asc order from the users table with an
    additional generation field that indicates the generation to which each user belongs based on the above definitions.

    Sounds simple? You are not allowed to use the CASE WHEN operator for this task :-)

    GLHF!

    Desired Output
    The desired output should look like this:

        id	name	birthdate	generation
        1	Mr. Nerissa Cremin	1994-03-15	Millennials
        2	Mattie Lind	1961-04-05	Baby Boomers
        3	Cody Murray	1966-12-05	Generation X
        ...
*/


WITH generations_lookup AS (
  SELECT *
  FROM (
    VALUES
      (0, 1927, 'Greatest Generation'),
      (1928, 1945, 'Silent Generation'),
      (1946, 1964, 'Baby Boomers'),
      (1965, 1980, 'Generation X'),
      (1981, 1996, 'Millennials'),
      (1997, 2012, 'Generation Z')
  ) AS lookup(from_year, to_year, generation_name)
)

SELECT
  id,
  name,
  birthdate,
  lookup.generation_name AS generation
FROM users
LEFT JOIN generations_lookup AS lookup
  ON DATE_PART('year', users.birthdate) >= lookup.from_year
  AND DATE_PART('year', users.birthdate) <= lookup.to_year
ORDER BY id ASC
