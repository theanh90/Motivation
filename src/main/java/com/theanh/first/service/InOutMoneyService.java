package com.theanh.first.service;

import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.InOutMoneyInModel;

public interface InOutMoneyService {
	void save(InOutMoneyInModel data);
	DataTableJson getListInOutMoney(String sort, String order, int limit, int offset, 
			String typeSearch, String textSearch);
	void deleteInOutMoney(Integer id, String whoCancel);

}
