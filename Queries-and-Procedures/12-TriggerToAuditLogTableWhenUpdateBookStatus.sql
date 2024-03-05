/* 12. **Trigger Implementation**
- Design a trigger to log an entry into a separate **`AuditLog`** table 
whenever a book's status changes from 'Available' to 'Borrowed' 
or vice versa. The **`AuditLog`** should capture **`BookID`**, **`StatusChange`**, and **`ChangeDate`**. */


CREATE TABLE AuditLog (
    LogID INT PRIMARY KEY IDENTITY,
    BookID INT,
    StatusChangedTo VARCHAR(50),
	ChangeDate DATETIME
    );

GO
CREATE OR ALTER TRIGGER BookStatusChange
ON Books
AFTER UPDATE
AS
BEGIN
        INSERT INTO AuditLog (BookID, StatusChangedTo, ChangeDate)
        SELECT BookID, CurrentStatus, GETDATE()
        FROM INSERTED
END;




/* TEST */
UPDATE Loans
SET DateReturned = GETDATE() where LoanID = 2;

SELECT *
FROM Loans
WHERE BookID = 27


select *
from books
where BookID = 27

select * from AuditLog