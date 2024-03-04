WITH ActiveBorrowersId_CTE AS
(
SELECT Borrowers.BorrowerID
FROM Borrowers
INNER JOIN Loans ON Loans.BorrowerID = Borrowers.BorrowerID AND Loans.DateReturned IS  NULL 
GROUP BY Borrowers.BorrowerID
HAVING  COUNT(*) >= 2
)
SELECT Borrowers.*
FROM ActiveBorrowersId_CTE
INNER JOIN Borrowers ON ActiveBorrowersId_CTE.BorrowerID = Borrowers.BorrowerID