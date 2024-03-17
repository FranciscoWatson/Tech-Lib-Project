/* Overdue Analysis: List all books overdue by more than 30 days with their associated borrowers. */

WITH LoansWithOverDueDays
AS
(
SELECT *,
DATEDIFF(DAY, DueDate,COALESCE(DateReturned,GETDATE())) AS OverDueDays
FROM Loans 
)

SELECT Borrowers.BorrowerID, Borrowers.FirstName, Borrowers.LastName, Books.BookID, Books.Title, Books.Author, LoansWithOverDueDays.OverDueDays
FROM LoansWithOverDueDays
INNER JOIN Borrowers ON Borrowers.BorrowerID = LoansWithOverDueDays.BorrowerID
INNER JOIN Books ON Books.BookID = LoansWithOverDueDays.BookID
WHERE LoansWithOverDueDays.OverDueDays > 30
