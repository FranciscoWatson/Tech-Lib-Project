/* Borrowing Frequency using Window Functions: Rank borrowers based on borrowing frequency. */

/* Can use DENSE_RANK instead of rank */

SELECT Borrowers.BorrowerID, Borrowers.FirstName, Borrowers.LastName, RANK() OVER (ORDER BY COUNT(*) DESC) AS RankByBorrowingFrequency
FROM Borrowers
INNER JOIN Loans ON Loans.BorrowerID = Borrowers.BorrowerID
GROUP BY Borrowers.BorrowerID, Borrowers.FirstName, Borrowers.LastName

