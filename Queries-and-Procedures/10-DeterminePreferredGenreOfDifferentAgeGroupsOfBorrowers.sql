/* Genre Preference by Age using Group By and Having: Determine the preferred genre of different age groups of borrowers. (Groups are (0,10), (11,20), (21,30)…) */

WITH BorrowersWithAgeGroup AS (
	SELECT BorrowerID, DateOfBirth, CASE
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 41 AND 50 THEN '41-50'
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 51 AND 60 THEN '51-60'
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 61 AND 70 THEN '61-70'
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 71 AND 80 THEN '71-80'
						WHEN DATEDIFF(YEAR, Borrowers.DateOfBirth, GETDATE()) BETWEEN 81 AND 90 THEN '81-90'
						ELSE '90+'
				END AS AgeGroup
	FROM Borrowers
), 
BorrowingCountForEachGenre AS(
	SELECT AgeGroup, COUNT(*) AS BorrowingsCount, Books.Genre, ROW_NUMBER() OVER (PARTITION BY AgeGroup ORDER BY COUNT(*) DESC) AS GenreRank

	FROM BorrowersWithAgeGroup
	INNER JOIN Loans ON Loans.BorrowerID = BorrowersWithAgeGroup.BorrowerID
	INNER JOIN Books ON Books.BookID = Loans.BookID
	GROUP BY AgeGroup, Books.Genre
	HAVING COUNT(*) > 0)
SELECT BorrowingCountForEachGenre.AgeGroup, BorrowingCountForEachGenre.BorrowingsCount, BorrowingCountForEachGenre.Genre
FROM BorrowingCountForEachGenre 
WHERE GenreRank = 1;
