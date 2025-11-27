/*
In the online tutoring platform, tutors set their availability by specifying a start and end time for each slot. These slots, spanning from 1970 to 2999, can overlap. Your task is to write a performant PostgreSQL query that calculates the total availability time for a specific tutor (e.g., user_id= 777) over their entire record. The query should efficiently handle a large dataset, merging overlapping intervals to compute the total distinct availability in minutes.

The availability table in your PostgreSQL database has the following schema:

- id (integer) - The unique identifier for each availability entry.
- user_id (integer) - The unique identifier for the user (tutor).
- avail_start (timestamp) - The start time of the availability slot.
- avail_end (timestamp) - The end time of the availability slot.

Write a PostgreSQL query that calculates the total availability time for the user with user_id= 777.
The total availability time should be the sum of the durations of all distinct (non-overlapping) availability slots.
The result should be given in minutes as a column total_minutes of integer type.
The overlapping intervals should be merged. For example, if there is one interval from 16:00 to 17:00 and
 another from 16:30 to 17:30, the total availability should be considered as 90 minutes, not 120.

Let's provide a concrete example:

    | id | user_id | avail_start         | avail_end           |
    +----+---------+---------------------+---------------------+
    | 1  | 777     | 2023-07-24 16:00:00 | 2023-07-24 17:00:00 |
    | 2  | 777     | 2023-07-24 16:00:00 | 2023-07-24 16:50:00 |
    | 3  | 777     | 2023-07-24 18:00:00 | 2023-07-24 18:30:00 |
    | 4  | 777     | 2023-07-24 17:30:00 | 2023-07-24 18:10:00 |
    | 5  | 777     | 2023-07-24 16:00:00 | 2023-07-24 17:10:00 |
    | 6  | 777     | 2023-07-24 16:00:00 | 2023-07-24 16:50:00 |

The result should be:

    | total_minutes |
    +---------------+
    | 130           |
*/

with ordered_dates as (
  select
    user_id,
    avail_start,
    avail_end,
    lag(avail_end) over (partition by user_id order by avail_start) as prev_end_date
  from availability
),

grouped_ranges as (
  select
    user_id,
    avail_start,
    avail_end,
    sum(case when prev_end_date is null or avail_start > prev_end_date then 1 else 0 end)
        over (partition by user_id order by avail_start rows unbounded preceding) as grp
  from ordered_dates
),

merged_ranges as (
  select
    user_id,
    min(avail_start) as avail_start,
    max(avail_end) as avail_end
  from grouped_ranges
  group by user_id, grp
)

select
  sum(extract(epoch from (avail_end - avail_start)) / 60) as total_minutes
from merged_ranges
