
/* 1st Query */
CREATE INDEX Index_Loans_BorrowerID
ON Loans (BorrowerID);


/*2nd Query*/
CREATE INDEX Index_Loans_ActiveBorrowers
ON Loans (BorrowerID, DateReturned);

/* 4th Query */
CREATE INDEX Index_Loans_DateBorrowed_DueDate
ON Loans (DateBorrowed, DueDate);


/* 5th Query */
CREATE INDEX Index_Borrowers_Email
ON Borrowers (Email);


/* 7th Query*/
CREATE INDEX Index_Loans_BookID
ON Loans (BookID);


/* 8th Query*/
CREATE INDEX Index_Loans_DueDate
ON Loans (DueDate);

CREATE INDEX Index_Loans_DateReturned
ON Loans (DateReturned);


/* 10th Query */
CREATE INDEX Index_Books_Genre
ON Books (Genre);

/* 11th Query */
CREATE INDEX Index_Loans_DateBorrowed
ON Loans (DateBorrowed);

/* 14th Query*/
CREATE INDEX Index_Loans_OverdueCheck
ON Loans (BorrowerID, DueDate, DateReturned);
