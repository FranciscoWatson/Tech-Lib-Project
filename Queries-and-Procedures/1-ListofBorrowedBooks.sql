DECLARE @BorrowerID INT = 5

SELECT Books.*
FROM Books
INNER JOIN Loans ON Loans.BookID = Books.BookID
WHERE Loans.BorrowerID = @BorrowerID;
