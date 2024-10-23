/* Author Popularity using Aggregation: Rank authors by the borrowing frequency of their books. */

SELECT Books.Author, Count(Loans.LoanID) AS BooksBorrowingCount, RANK() OVER( ORDER BY  COUNT(Loans.LoanID) DESC ) AS AuthorPopularityRank
FROM Books
LEFT JOIN Loans ON Loans.BookID = Books.BookID 
GROUP BY Books.Author