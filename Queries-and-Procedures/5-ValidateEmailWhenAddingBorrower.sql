/* 5. **Stored Procedure - Add New Borrowers**:
    - **Procedure Name**: **`sp_AddNewBorrower`**
    - **Purpose**: Streamline the process of adding a new borrower.
    - **Parameters**: **`FirstName`**, **`LastName`**, **`Email`**, **`DateOfBirth`**, **`MembershipDate`**.
    - **Implementation**: Check if an email exists; if not, add to **`Borrowers`**. If existing, return an error message.
    - **Return**: The new **`BorrowerID`** or an error message. */

DROP PROCEDURE IF EXISTS sp_AddNewBorrower;
GO
CREATE PROCEDURE sp_AddNewBorrower (@FirstName VARCHAR(50), @LastName VARCHAR(50), @Email VARCHAR(255), @DateOfBirth DATE, @MembershipDate DATE, @message VARCHAR(50) output)
AS BEGIN 
	IF EXISTS (SELECT 1 FROM Borrowers where Email = @Email)
		BEGIN
			SET @message = 'Error: Email already exists'
		END
	ELSE
		BEGIN
			INSERT INTO Borrowers (FirstName, LastName, Email, DateOfBirth, MembershipDate) 
			VALUES (@FirstName, @LastName, @Email, @DateOfBirth, @MembershipDate);
			SET @message = 'Borrower Successfully Added with ID: '+ CONVERT(VARCHAR, SCOPE_IDENTITY());
		END
END;
GO

/* test */
DECLARE @message VARCHAR(50);
EXEC sp_AddNewBorrower 'Francisco', 'Watson', 'fran@gmail.com', '1996-09-04', '2024-05-03', @message OUTPUT;
PRINT @message; 