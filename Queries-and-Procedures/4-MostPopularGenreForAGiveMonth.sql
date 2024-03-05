/* Popular Genre Analysis using Joins and Window Functions: Identify the most popular genre for a given month. */

DECLARE @month INT = 11;
DECLARE @year INT = 2021;

SELECT TOP 1 Books.Genre, RANK() OVER (ORDER BY COUNT(*) DESC) AS RankByLoans
FROM Books
INNER JOIN Loans ON Loans.LoanID = Books.BookID
 WHERE
        (	(YEAR(Loans.DateBorrowed) = @year OR YEAR(Loans.DueDate) = @year)
			AND (
            (MONTH(Loans.DateBorrowed) <= @month AND MONTH(Loans.DueDate) >= @month))
        )
GROUP BY Books.Genre
