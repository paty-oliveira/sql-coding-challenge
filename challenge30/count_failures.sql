/*
    We have a PostgreSQL DB table interview_failures. This table contains information about various unfortunate reasons candidates failed their interviews:

    - candidate_name (varchar): name of the candidate
    - failure_reason (varchar): reason for the interview failure
    - interview_date (date): Date of the interview

    You need to find the total number of interview failures grouped by the failure_reason in the interview_failures table without using the COUNT() function or relying on any auto-incrementing id column.

    The result set should contain the following columns:
    1. failure_reason (varchar): reason for the interview failure
    2. cnt (int): count of the employees who failed because of that reason.

    Order the results by cnt in descending order. If the count is the same for multiple reasons, order them alphabetically by the reason.

    For this sample data:

    | candidate_name  | failure_reason                                          | interview_date |
    |-----------------|---------------------------------------------------------|----------------|
    | John Doe        | Tried to debug with print statements on a whiteboard    | 2023-01-10     |
    | Jane Smith      | Confused HTML with a programming language               | 2023-02-14     |
    | Bob Brown       | Pasted Stack Overflow code without understanding it     | 2023-03-01     |
    | Alice Green     | Used "sudo" in a Java program                           | 2023-04-01     |
    | Charlie Black   | Thought Git was a type of food                          | 2023-05-05     |
    | Dave White      | Wrote an infinite loop in a live coding test            | 2023-06-15     |
    | Eve Blue        | Claimed to be fluent in binary but spoke in octal       | 2023-07-20     |
    | Alice Smith     | Claimed to be a Python expert but couldn't write a loop | 2023-05-01     |
    | Jane Smith      | Tried to fix a bug live and crashed the system          | 2023-03-14     |
    | Dave Brown      | Claimed to be a Python expert but couldn't write a loop | 2023-06-15     |
    | Stephen Fry     | Didn't know the difference between inner and left joins | 2023-06-19     |
*/

SELECT DISTINCT failure_reason,
  SUM(1) OVER(PARTITION BY failure_reason) AS cnt
FROM interview_failures
ORDER BY cnt DESC, failure_reason ASC
