package com.theanh.first.service;

import java.util.Date;

public interface HomeService {
	Object getInvoiceReport(Date startDate, Date endDate);
	Object getInOutReport(Date startDate, Date endDate);
	Object getLeftTotalMoney();
}
