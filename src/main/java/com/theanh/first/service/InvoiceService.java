package com.theanh.first.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.InvoiceDetailCustomerViewModel;
import com.theanh.first.model.inmodel.InvoiceInModel;

public interface InvoiceService {
	Integer save(InvoiceInModel invoice);
	DataTableJson getListInvoiceCustomer(String sort, String order, Integer limit, int offset, 
			String typeSearch, String textSearch, Integer statusType, Long from, Long to) throws ParseException;
	List<InvoiceDetailCustomerViewModel> getViewById(Integer id);
	Integer changeInvoiceStatus(Integer invoiceId);
	Boolean deleteInvoice(Integer invoiceId, String role);
	Boolean setInvoiceStatusToRquest(Integer invoiceId);
	Boolean doPay(Map<String, Integer> data);

}
