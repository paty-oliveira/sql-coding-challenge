/*
You need to create a function that calculates the number of weekdays (Monday through Friday)
 between two dates inclusively.

The function should be named weekdays accept two arguments of type DATE and return an INTEGER value.
*/

CREATE FUNCTION weekdays(date, date) 
RETURNS INTEGER AS 
$$ 
SELECT COUNT(*)
FROM generate_series($1, $2, '1 day'::interval) AS dt
WHERE extract(DOW from dt) NOT IN (5, 6) 
$$
LANGUAGE SQL; 

SELECT weekdays('2016-01-01', '2016-01-10');
SELECT weekdays('2016-01-10', '2016-01-01');