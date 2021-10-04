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

## Useful notes about RSpec SQL

A small set of utility methods and classes have been provided to make testing and displaying SQL queries easy with Ruby. These utility methods are available from any file in the runner.

- **$sql** is a global variable which contains the user's SQL solution
- **run_sql** is a method that will run the user's query, execute any non-SELECT statements and print and return any result sets from SQL SELECT statements.
- **compare_with** is a method which compares the candidate's submitted query to the reference query and auto-generates a test suite based on the expected query results.
