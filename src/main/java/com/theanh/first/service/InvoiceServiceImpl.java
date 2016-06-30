package com.theanh.first.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.InvoiceDao;
import com.theanh.first.dao.InvoiceDetailsDao;
import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.InvoiceDetailCustomerViewModel;
import com.theanh.first.model.InvoiceDetailsModel;
import com.theanh.first.model.InvoiceModel;
import com.theanh.first.model.inmodel.InvoiceDetailsInModel;
import com.theanh.first.model.inmodel.InvoiceInModel;
import com.theanh.first.util.Constant;

@Transactional
public class InvoiceServiceImpl implements InvoiceService {
	
	private InvoiceDao invoiceDao;
	private InvoiceDetailsDao invoiceDetailsDao;
		
	public InvoiceDao getInvoiceDao() {
		return invoiceDao;
	}

	public void setInvoiceDao(InvoiceDao invoiceDao) {
		this.invoiceDao = invoiceDao;
	}

	public InvoiceDetailsDao getInvoiceDetailsDao() {
		return invoiceDetailsDao;
	}

	public void setInvoiceDetailsDao(InvoiceDetailsDao invoiceDetaisDao) {
		this.invoiceDetailsDao = invoiceDetaisDao;
	}

	@Override
	public Integer save(InvoiceInModel invoiceIn) {
		InvoiceModel invoice = new InvoiceModel();
		invoice.setActive(1);
		invoice.setCid(invoiceIn.getCustomer_id());
		invoice.setDateCreate(invoiceIn.getDate_input());
		invoice.setLastStatus(Constant.INVOICE_STATUS_NEW);
		invoice.setNote(invoiceIn.getNote());
		invoice.setTotalPay(invoiceIn.getTotalPay());
		invoice.setTotalPrice(invoiceIn.getTotalCalculated());
		invoice.setIsExpress(invoiceIn.getExpress_wash());
		if (invoiceIn.getDiscount() == null) {
			invoice.setDiscount(0);
		} else {
			invoice.setDiscount(invoiceIn.getDiscount());			
		}
		if (invoiceIn.getVat() == null) {
			invoice.setVat(0);
		} else {
			invoice.setVat(invoiceIn.getVat());
		}
		
		Integer invoiceId = invoiceDao.save(invoice);
		
		InvoiceDetailsModel product;
		for (InvoiceDetailsInModel productIn : invoiceIn.getProducts()) {
			product = new InvoiceDetailsModel();
			product.setInId(invoiceId);
			product.setPid(productIn.getPid());
			product.setQuantity(productIn.getQtt());
			product.setTypePrice(productIn.getPrice_type());
			product.setUnitPrice(productIn.getUnit_price());
			
			invoiceDetailsDao.save(product);
		}
		
		return invoiceId;
	}

	@Override
	public DataTableJson getListInvoiceCustomer(String sort, String order, Integer limit, int offset, 
			String typeSearch, String textSearch, Integer statusType, Long from, Long to) throws ParseException {
		DataTableJson dataTableJson = new DataTableJson();
		List<Object> lsObj = new ArrayList<>(); 
		
		lsObj = invoiceDao.getListInvoiceCustomer(sort, order, limit, offset, typeSearch, textSearch, statusType, from, to);		
		
		dataTableJson.setTotal((long)lsObj.get(lsObj.size() - 1));
		lsObj.remove(lsObj.size() - 1);
		dataTableJson.setStatus(DataTableJson.SUCCESS);
		dataTableJson.setRows(lsObj);
		
		return dataTableJson;
	}

	@Override
	public List<InvoiceDetailCustomerViewModel> getViewById(Integer id) {
		return invoiceDao.getViewById(id);		
	}

	@Override
	public Integer changeInvoiceStatus(Integer invoiceId) {
		Integer currentStatus;
		InvoiceModel invoice = new InvoiceModel();
		invoice = invoiceDao.getByKey(invoiceId);
		
		currentStatus = invoice.getLastStatus();
		if (currentStatus <= 0 || currentStatus >= 5) {
			return null;
		}
		
		invoice.setLastStatus(currentStatus + 1);
		
		invoiceDao.update(invoice);
		return invoice.getLastStatus();
	}

	@Override
	public Boolean deleteInvoice(Integer invoiceId) {
		InvoiceModel invoice = new InvoiceModel();
		invoice = invoiceDao.getByKey(invoiceId);
		
		if (invoice.getLastStatus() != 1)
			return false;
		
		invoiceDao.delete(invoice);
		invoiceDetailsDao.deleteByInvoiceId(invoiceId);
		
		return true;
	}

	@Override
	public Boolean setInvoiceStatusToRquest(Integer invoiceId) {
		InvoiceModel invoice = new InvoiceModel();
		invoice = invoiceDao.getByKey(invoiceId);
		
		if (invoice.getLastStatus() != 2)
			return false;
		
		invoice.setLastStatus(-1);
		invoiceDao.save(invoice);
		
		return true;
	}

	@Override
	public Boolean doPay(Map<String, Integer> data) {
		Integer invoiceId = data.get("invoiceId");
		Integer money = data.get("money");
		
		InvoiceModel invoice = new InvoiceModel();
		invoice = invoiceDao.getByKey(invoiceId);
		
		if (invoice.getTotalPrice() - invoice.getTotalPay() == 0)
			return false;
		
		invoice.setTotalPay(invoice.getTotalPay() + money);
		invoiceDao.save(invoice);		
		
		return true;
	}

}
