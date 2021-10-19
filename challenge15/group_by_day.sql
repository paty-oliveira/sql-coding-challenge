/*
There is an events table used to track different key activities taken on a website. 
For this task you need to filter the name field to only show "trained" events. 
Events should be grouped by the day they happened and the grouping count. 
The description field is used to distinguish which items the events happened on.

"events" Table Schema
    id
    name (String)
    created_at (DateTime)
    description (String)
*/


SELECT created_at::DATE AS day,
  description,
  COUNT(id) AS count
FROM events
WHERE name = 'trained'
GROUP BY 1, 2