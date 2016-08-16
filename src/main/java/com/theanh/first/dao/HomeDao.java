package com.theanh.first.dao;

import java.util.Date;

public interface HomeDao {
	Object getInvoiceReport(Date startDate, Date endDate);
	Object getInOutReport(Date startDate, Date endDate);
	Object getLeftTotalMoney();

}
