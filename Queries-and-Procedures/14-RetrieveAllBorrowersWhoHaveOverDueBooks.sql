/* 14. **SQL Stored Procedure with Temp Table**:
- Design a stored procedure that retrieves all borrowers who have overdue books.
Store these borrowers in a temporary table, then join this temp table with the **`Loans`** table to list out the specific overdue books for each borrower. */


CREATE OR ALTER PROCEDURE sp_OverdueBooks
AS
BEGIN
	CREATE TABLE #BorrowersWithOverdueBooks (
			BorrowerID INT PRIMARY KEY
		);


	INSERT INTO #BorrowersWithOverdueBooks (BorrowerID)
		SELECT DISTINCT BorrowerID
		FROM Loans
		WHERE DATEDIFF(DAY, DueDate,COALESCE(DateReturned,GETDATE())) > 0 AND DateReturned IS NULL


	SELECT Borrowers.BorrowerID, FirstName, Borrowers.LastName, Books.BookID, Books.Title, Books.Author
	FROM #BorrowersWithOverdueBooks
	INNER JOIN Borrowers ON Borrowers.BorrowerID = #BorrowersWithOverdueBooks.BorrowerID
	INNER JOIN Loans ON Loans.BorrowerID = #BorrowersWithOverdueBooks.BorrowerID
	INNER JOIN Books ON Books.BookID = Loans.BookID

	DROP TABLE #BorrowersWithOverdueBooks;

END;