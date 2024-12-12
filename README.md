# Coding challenges

The goal of this repository is to improve SQL programming skills with a coding challenge. The implementation of these challenges follows the methodology of Test-Driven Development, i.e.:

- Think about tests cases
- Write the tests
- Implement the code
- Test
- Refactoring
- Test again until all tests pass

The challenges are based on [Codewars](https://www.codewars.com/) exercises. The SQL engine is PostgreSQL 9.6 and the tests cases are based on Behavior Driven Development of [Ruby/RSpec SQL](https://docs.qualified.io/reference/languages/sql/rspec/#why-rubyrspec).

1. [Trimming the Field](challenge01)
2. [Simple Having](challenge02)
3. [Count Weekdays](challenge03)
4. [Members Approved for Voucher](challenge04)
5. [Hierarchical Structure](challenge05)
6. [Calculating Running Total](challenge06)
7. [Present XML data to SQL way](challenge07)
8. [Top 10 customer by total payments amount](challenge08)
9. [Analyzing the sales by product and date](challenge09)
10. [SQL with Harry Potter: Sorting Hat Comparators](challenge10)
11. [Top Departments](challenge11)
12. [Conditional Count](challenge12)
13. [Monsters using CASE](challenge13)
14. [Elven Wildcards](challenge14)
15. [Group by day](challenge15)
16. [Age Calculator](challenge16)
17. [Ranking Sales](challenge17)
18. [Maths with String Manipulation](challenge18)
19. [Regex Extraction](challenge19)
20. [Filtering Sales](challenge20)
21. [Using Window Functions to Get Top N per Group](challenge21)
22. [Find all Movies that Two Actors Cast in Together](challenge22)
23. [Simple table totaling](challenge23)
24. [Regex AlphaNumeric Split](challenge24)
25. [Pivoting data](challenge25)
26. [Returning Strings](challenge26)
27. [Handling with Nulls](challenge27)
28. [Number of countries visited](challenge28)
## Useful notes about RSpec SQL

A small set of utility methods and classes have been provided to make testing and displaying SQL queries easy with Ruby. These utility methods are available from any file in the runner.

- **$sql** is a global variable which contains the user's SQL solution
- **run_sql** is a method that will run the user's query, execute any non-SELECT statements and print and return any result sets from SQL SELECT statements.
- **compare_with** is a method which compares the candidate's submitted query to the reference query and auto-generates a test suite based on the expected query results.
