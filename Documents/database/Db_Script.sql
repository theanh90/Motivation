
-- View for invoice with customer infomation --
CREATE OR REPLACE VIEW InvoiceCustomerView AS
SELECT I.InId, I.Cid, I.DateCreate, I.TotalPrice, I.TotalPay, I.Vat, I.Discount, I.IsExpress, I.Note, I.LastStatus, I.Active,
		C.Name, C.Phone, C.Email, C.Address
FROM INVOICE I, CUSTOMER C 
WHERE 1 = 1
	AND I.Cid = C.CID
ORDER BY I.DateCreate DESC