package com.theanh.first.service;

import java.text.ParseException;

import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.inmodel.InvoiceInModel;

public interface InvoiceService {
	void save(InvoiceInModel invoice);
	DataTableJson getListInvoiceCustomer(String sort, String order, Integer limit, int offset, 
			String typeSearch, String textSearch, Integer statusType, Long from, Long to) throws ParseException;

}
