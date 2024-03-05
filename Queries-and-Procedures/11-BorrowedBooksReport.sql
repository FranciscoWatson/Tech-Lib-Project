/* 11. **Stored Procedure - Borrowed Books Report**:
    - **Procedure Name**: **`sp_BorrowedBooksReport`**
    - **Purpose**: Generate a report of books borrowed within a specified date range.
    - **Parameters**: **`StartDate`**, **`EndDate`**
    - **Implementation**: Retrieve all books borrowed within the given range, with details like borrower name and borrowing date.
    - **Return**: Tabulated report of borrowed books. */


CREATE OR ALTER PROCEDURE sp_BorrowedBooksReport @StartDate DATE, @EndDate DATE
	AS
	BEGIN
		SELECT Books.BookID, Books.Title, Borrowers.FirstName, Borrowers.LastName, Loans.DateBorrowed
		FROM Books
		INNER JOIN Loans ON Loans.BookID = Books.BookID
		INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
		WHERE Loans.DateBorrowed BETWEEN @StartDate AND @EndDate;
	END;

/* TEST */
EXEC sp_BorrowedBooksReport @StartDate = '2020-01-01', @EndDate = '2024-02-29';
