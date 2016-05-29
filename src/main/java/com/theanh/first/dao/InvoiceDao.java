package com.theanh.first.dao;

import java.text.ParseException;
import java.util.List;

import com.theanh.first.model.InvoiceDetailCustomerViewModel;
import com.theanh.first.model.InvoiceModel;

public interface InvoiceDao {
	InvoiceModel getByKey(Integer invoiceId);
	Integer save(InvoiceModel invoice);
	void update(InvoiceModel invoice);
	void delete(InvoiceModel invoice);
	List<Object> getListInvoiceCustomer(String sort, String order, int limit, int offset, String typeSearch, 
			String textSearch, Integer statusType, Long from, Long to) throws ParseException;
	List<InvoiceDetailCustomerViewModel> getViewById(Integer id);
}
