CREATE VIEW TransactionSummary AS
SELECT 
    FORMAT(T.TransactionDate, 'yyyy-MM') AS MonthYear,
    C.CustomerID,
    C.Name AS CustomerName,
    COUNT(T.TransactionID) AS TotalTransactions,
    SUM(CASE WHEN T.TransactionType = 'Credit' THEN T.Amount ELSE 0 END) AS TotalCredits,
    SUM(CASE WHEN T.TransactionType = 'Debit' THEN T.Amount ELSE 0 END) AS TotalDebits,
    SUM(T.Amount) AS TotalAmount,
    COUNT(DISTINCT T.Status) AS UniqueStatuses
FROM Transactions T
INNER JOIN Customers C ON T.CustomerID = C.CustomerID
GROUP BY FORMAT(T.TransactionDate, 'yyyy-MM'), C.CustomerID, C.Name;
