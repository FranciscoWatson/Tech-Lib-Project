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
