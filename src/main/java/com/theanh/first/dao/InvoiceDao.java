package com.theanh.first.dao;

import java.text.ParseException;
import java.util.List;

import com.theanh.first.model.InvoiceModel;

public interface InvoiceDao {
	Integer save(InvoiceModel invoice);
	List<Object> getListInvoiceCustomer(String sort, String order, int limit, int offset, String typeSearch, 
			String textSearch, Integer statusType, Long from, Long to) throws ParseException;
}
