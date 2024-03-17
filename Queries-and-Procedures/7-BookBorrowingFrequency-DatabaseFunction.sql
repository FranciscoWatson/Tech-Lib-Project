/* 7. **Database Function - Book Borrowing Frequency**:
    - **Function Name**: **`fn_BookBorrowingFrequency`**
    - **Purpose**: Gauge the borrowing frequency of a book.
    - **Parameter**: **`BookID`**
    - **Implementation**: Count the number of times the book has been issued.
    - **Return**: Borrowing count of the book. */


CREATE OR ALTER FUNCTION fn_BookBorrowingFrequency (@BookID INT)
RETURNS INT AS
BEGIN
	DECLARE @BookCount INT;
		SELECT @BookCount =  COUNT(*)
		FROM Loans
		WHERE Loans.BookID = @BookID
		GROUP BY Loans.BookID
    RETURN @BookCount;
END;
GO

/* TEST */
DECLARE @BookID INT = 12;
DECLARE @test INT;
SET @test = dbo.fn_BookBorrowingFrequency(@BookID);
PRINT CAST(@test AS VARCHAR);



