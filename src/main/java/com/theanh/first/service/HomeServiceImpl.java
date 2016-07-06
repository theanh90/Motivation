package com.theanh.first.service;

import java.util.Date;

import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.HomeDao;
import com.theanh.first.dao.InvoiceDao;

@Transactional
public class HomeServiceImpl implements HomeService{
	InvoiceDao invoiceDao;
	HomeDao homeDao;

	public InvoiceDao getInvoiceDao() {
		return invoiceDao;
	}

	public void setInvoiceDao(InvoiceDao invoiceDao) {
		this.invoiceDao = invoiceDao;
	}

	public HomeDao getHomeDao() {
		return homeDao;
	}

	public void setHomeDao(HomeDao homeDao) {
		this.homeDao = homeDao;
	}

	@Override
	public Object getInvoiceReport(Date startDate, Date endDate) {
		return homeDao.getInvoiceReport(startDate, endDate);
	}

	@Override
	public Object getInOutReport(Date startDate, Date endDate) {
		return homeDao.getInOutReport(startDate, endDate);
	}
	
}
