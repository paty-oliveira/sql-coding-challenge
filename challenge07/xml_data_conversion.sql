/*
Given the database where all the users' data is stored in one huge XML string, fetch it as separate rows and columns.

Notes
    - The private field determines whether the user's email address should be publicly visible
    - If the profile is private, email_address should equal "Hidden"
    - The users may have multiple email addresses
    - If no email addresses are provided, email_address should equal "None"
    - If there're multiple email addresses, the first one should be shown
    - The date_of_birth is in the yyyy-mm-dd format
    - The age fields represents the user's age in years
    - Order the result by the first_name, and last_name columns

Output table:
------------------------
|    Column     | Type |
|---------------+------|
| first_name    | text |
| last_name     | text |
| age           | int  |
| email_address | text |
------------------------
*/

WITH users_raw_info AS (
  SELECT first_name,
    last_name,
    EXTRACT(YEAR FROM AGE(birth_date::DATE))::INTEGER AS age,
    CASE
      WHEN email = ''
        THEN 'None'
      WHEN email <> ''
        THEN email
      ELSE 'None'
    END AS email,
    private::BOOLEAN
  FROM (
    SELECT unnest(xpath('/data/user/first_name/text()', data))::TEXT AS first_name,
    unnest(xpath('/data/user/last_name/text()', data))::TEXT AS last_name,
    unnest(xpath('/data/user/date_of_birth/text()', data))::TEXT AS birth_date,
    unnest(xpath('/data/user/email_addresses/address/text()', data))::TEXT AS email,
    unnest(xpath('/data/user/private/text()', data))::TEXT AS private
FROM users) t
),
users_cleaned_data AS (
  SELECT first_name,
  last_name,
  age,
  CASE 
    WHEN private
      THEN 'Hidden'
    ELSE email  
  END email_address,
  ROW_NUMBER() OVER(PARTITION BY first_name, last_name) AS r
FROM users_raw_info
WHERE 
ORDER BY first_name, last_name
)
SELECT first_name,
  last_name,
  age,
  email_address
FROM users_cleaned_data
WHERE r = 1;
