CREATE PROCEDURE GetCustomerTransactions
    @StartDate DATE,
    @EndDate DATE,
    @Status NVARCHAR(20) = NULL -- Optional filter
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        T.TransactionID,
        C.Name AS CustomerName,
        T.TransactionDate,
        T.Amount,
        T.TransactionType,
        T.Status
    FROM Transactions T
    INNER JOIN Customers C ON T.CustomerID = C.CustomerID
    WHERE T.TransactionDate BETWEEN @StartDate AND @EndDate
    AND (@Status IS NULL OR T.Status = @Status)
    ORDER BY T.TransactionDate DESC;
END;
