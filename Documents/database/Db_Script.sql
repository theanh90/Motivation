
-- View for invoice with customer infomation --
CREATE OR REPLACE VIEW InvoiceCustomerView AS
SELECT I.InId, I.Cid, I.DateCreate, I.TotalPrice, I.TotalPay, (I.TotalPrice - I.TotalPay) DueAmount, I.Vat, I.Discount, I.IsExpress, I.Note, I.LastStatus, I.Active,
		C.Name, C.Phone, C.Email, C.Address
FROM INVOICE I, CUSTOMER C 
WHERE 1 = 1
	AND I.Cid = C.CID
ORDER BY I.DateCreate DESC

-- View for invoice with detail and customer infomation --
CREATE OR REPLACE VIEW InvoiceDetailCustomerView AS
SELECT I.InId, I.DateCreate, I.TotalPrice, (I.TotalPrice - I.TotalPay) DueAmount, I.TotalPay, I.Vat, I.Discount, I.IsExpress, I.Note InvoiceNote, I.LastStatus, I.Active InvoiceActive,
		D.Did, D.Pid, D.UnitPrice, D.TypePrice, D.Quantity,
		C.CID, C.Name, C.Phone, C.Email, C.Address, C.Note CustomerNote, C.Active CustomerActive,
        P.EnName, P.VnName
FROM INVOICE I
	INNER JOIN INVOICEDETAILS D
    	ON I.InId = D.InId
    INNER JOIN CUSTOMER C
    	ON I.Cid = C.CID
    INNER JOIN PRODUCT P
    	ON D.Pid = P.PID
ORDER BY I.InId  DESC


--####### For Report Homepage #######--

SELECT SUM(M.Money) Put
FROM InOutMoney M
WHERE 1 = 1 AND (
    M.Type = 1
	AND M.Active = 1
	AND M.DateCreate BETWEEN '2016/01/01' AND '2016/12/31'
);

SELECT SUM(M.Money) Withdraw
FROM InOutMoney M
WHERE 1 = 1 AND (
    M.Type = 0
	AND M.Active = 1
	AND M.DateCreate BETWEEN '2016/01/01' AND '2016/12/31'
);

SELECT sum(case when M.Type = 1 then M.Money else 0 end) Put,      
		sum(case when M.Type = 0 then M.Money else 0 end) Withdraw 
FROM InOutMoney M
WHERE M.Active = 1
AND M.DateCreate BETWEEN '2016/01/01' AND '2016/12/31'


SELECT SUM(TotalTable.Money)
FROM (
    SELECT SUM(I.TotalPay) Money
    FROM Invoice I
    WHERE I.LastStatus <> -1
    UNION
    SELECT SUM(case when M.Type = 1 then M.Money else -M.Money end) Money
    FROM InOutMoney M 
    WHERE M.Active = 1
) TotalTable