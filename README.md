# Tech-Lib-Project

## 1. Design

### Entity-Relationship Model (ERM)

![image](Entity-Relationship-Model.png)

### Database Schema Design

![image](Database-Schema-Design.jpg)

## 2. Design the Relational Schema using MS SQL:

[Database and Table Creation](Database-Creation-and-Schema.sql)

## 3. Build and Seed the Database:

- [Books](BooksSeed.sql)
- [Loans](LoansSeed.sql)
- [Borrowers](BorrowersSeed.sql)

## 4. Complex Queries and Procedures

1.  [List of Borrowed Books](Queries-and-Procedures/1-ListofBorrowedBooks.sql): Retrieve all books borrowed by a specific borrower, including those currently unreturned.
2.  [Active Borrowers with CTEs](Queries-and-Procedures/2-ActiveBorrowersWithCTE.sql): Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs.
3.  [Rank Borrowers based on frequency](Queries-and-Procedures/3-RankBorrowersBasedOnFrequency.sql): Rank borrowers based on borrowing frequency.
4.  [Identify the most popular genre for a given month using Joins and Window Functions:](Queries-and-Procedures/4-MostPopularGenreForAGiveMonth.sql): Rank borrowers based on borrowing frequency.
5.  [Stored Procedure - Add New Borrowers](Queries-and-Procedures/5-ValidateEmailWhenAddingBorrower.sql)
6.  [Database Function - Calculate Overdue Fees](Queries-and-Procedures/6-CalculateOverdueFees-DatabaseFunction.sql)
7.  [Database Function - Book Borrowing Frequency](Queries-and-Procedures/7-BookBorrowingFrequency-DatabaseFunction.sql)
8.  [Overdue Analysis](Queries-and-Procedures/8-OverdueAnalysis.sql): List all books overdue by more than 30 days with their associated borrowers.
9.  [Author Popularity using Aggregation](Queries-and-Procedures/9-RankAuthorsByBorrowingFrequencyOfTheirBooks.sql): Rank authors by the borrowing frequency of their books.
