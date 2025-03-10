CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    City NVARCHAR(50),
    Country NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE()
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    TransactionDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(18,2),
    TransactionType NVARCHAR(50), -- e.g., 'Credit', 'Debit'
    Status NVARCHAR(20) -- e.g., 'Success', 'Failed', 'Pending'
);
