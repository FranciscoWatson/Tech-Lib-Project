/* Weekly peak days: The library is planning to employ a new part-time worker. 
This worker will work 3 days weekly in the library. From the data you have, determine the most 3 days in the week that have the most share of the loans and display the result of each day as a percentage of all loans.
Sort the results from the highest percentage to the lowest percentage. (eg. 25.18% of the loans happen on Monday...) */

WITH LoansBorrowedDay
AS
(
SELECT DATENAME(WEEKDAY,DateBorrowed) AS BorrowedWeekday
FROM Loans
)
SELECT TOP 3 BorrowedWeekday, COUNT(*) AS DaysCount, (COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()) AS LoansPercentage
FROM LoansBorrowedDay
GROUP BY BorrowedWeekday
ORDER BY LoansPercentage DESC


