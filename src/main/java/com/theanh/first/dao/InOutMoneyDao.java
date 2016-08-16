package com.theanh.first.dao;

import java.util.List;

import com.theanh.first.model.InOutMoneyModel;

public interface InOutMoneyDao {
	Integer save(InOutMoneyModel inoutModel);
	List<Object> getListCustomer(String sort, String order, int limit, int offset, 
			String typeSearch, String textSearch);
	InOutMoneyModel getByKey(Integer id);
}
