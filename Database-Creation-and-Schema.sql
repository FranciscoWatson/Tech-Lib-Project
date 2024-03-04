CREATE DATABASE Tech_Lib;

USE Tech_Lib;

CREATE TABLE Books (
	BookID INT IDENTITY,
	Title varchar(255) NOT NULL,
	Author varchar(100) NOT NULL,
	ISBN varchar(13) NOT NULL,
	PublishedDate date NOT NULL,
	Genre varchar(30) NOT NULL,
	ShelfLocation varchar(20) NOT NULL,
	CurrentStatus varchar(9) NOT NULL CHECK (CurrentStatus IN ('Borrowed','Available')),
	PRIMARY KEY (BookID)
);


CREATE TABLE Borrowers (
	BorrowerID INT IDENTITY,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Email varchar(255) NOT NULL,
	DateOfBirth date NOT NULL,
	MembershipDate date NOT NULL,
	PRIMARY KEY (BorrowerID)
);

CREATE TABLE Loans (
	LoanID INT IDENTITY,
	BookID int NOT NULL,
	BorrowerID int NOT NULL,
	DateBorrowed date NOT NULL,
	DueDate date NOT NULL,
	DateReturned date,
	PRIMARY KEY (LoanID),
	FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);


/* Trigger for Book's CurrentStatus*/
GO
CREATE TRIGGER UpdateBookStatus
ON Loans
AFTER INSERT,UPDATE 
AS
BEGIN
UPDATE Book SET CurrentStatus =
	CASE
		WHEN EXISTS (SELECT * FROM Loans WHERE Loans.BookID = book.BookID AND Loans.DateReturned IS NULL) 
			THEN 'Borrowed'
		Else 
			'Available'
	END
	FROM Books AS book
	WHERE EXISTS(SELECT * FROM inserted WHERE inserted.BookID = book.BookID)
END 
GO