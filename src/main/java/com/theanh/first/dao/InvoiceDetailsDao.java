package com.theanh.first.dao;

import com.theanh.first.model.InvoiceDetailsModel;

public interface InvoiceDetailsDao {
	Integer save(InvoiceDetailsModel product);
	void deleteByInvoiceId(Integer invoiceId);
}
