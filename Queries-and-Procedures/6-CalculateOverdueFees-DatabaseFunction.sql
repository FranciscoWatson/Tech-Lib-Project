/* 6. **Database Function - Calculate Overdue Fees**:
    - **Function Name**: **`fn_CalculateOverdueFees`**
    - **Purpose**: Compute overdue fees for a given loan.
    - **Parameter**: **`LoanID`**
    - **Implementation**: Charge fees based on overdue days: $1/day for up to 30 days, $2/day after.
    - **Return**: Overdue fee for the **`LoanID`**. */

CREATE OR ALTER FUNCTION fn_CalculateOverdueFees (@LoanID INT)
RETURNS MONEY AS
BEGIN
	DECLARE @OverdueDays INT;

    SELECT @OverdueDays = DATEDIFF(DAY, DueDate, COALESCE(DateReturned, GETDATE()))
	FROM Loans
	WHERE Loans.LoanID = @LoanID
	
	DECLARE @OverdueFee MONEY;
	IF @OverdueDays > 0
		BEGIN
			IF @OverdueDays <= 30
				SET @OverdueFee = @OverdueDays * 1.0; 
			ELSE
				SET @OverdueFee =  (@OverdueDays - 30) * 2.0 + 30; 
		END
    ELSE
        SET @OverdueFee = 0.0;

    RETURN @OverdueFee;
END;
GO

/*test*/
DECLARE @LoanID INT = 100;
DECLARE @OverdueFees MONEY;
SET @OverdueFees = dbo.fn_CalculateOverdueFees(@LoanID);
PRINT 'LoanID: ' + CAST(@LoanID AS VARCHAR) + ', OverdueFees: ' + CAST(@OverdueFees AS VARCHAR);

