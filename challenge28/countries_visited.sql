/*
    In this kata, you are provided with a database that contains information about people and their visits to various countries.

    Your task is to figure out how many countries each person has visited.

    Database Schema

    people table:
    - id (integer, primary key): Unique identifier for the person.
    - name (string): The person's name. You can assume that the names are unique.

    countries table:
    - id (integer, primary key): Unique identifier for the country.
    - name (string, unique): The name of the country.

    visits table:
    - id (integer, primary key): Unique identifier for the visit.
    - person_id (integer, foreign key): Refers to a person.
    - country_id (integer, foreign key): Refers to a country.
    - year (integer): The year of the visit.

    Requirements
    - Return a list of people and the number of countries they have visited.
    - First, sort the list by the number of countries visited, from highest to lowest. Then, if any people have the same number of countries visited, sort them by the person's name ascending.
    - Include all people in the list, even if they haven't visited any foreign countries.
    - Make sure to count the number of different countries each person has visited, as opposed to their total number of visits.
*/

SELECT people.name,
    count(DISTINCT visits.country_id) AS countries_visited
FROM people
LEFT JOIN visits
  ON people.id = visits.person_id
GROUP BY people.name
ORDER BY countries_visited DESC, people.name ASC
