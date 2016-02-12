package com.theanh.first.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.CustomerDao;
import com.theanh.first.dao.UserDao;
import com.theanh.first.model.CustomerModel;
import com.theanh.first.model.DataTableJson;

@Transactional
public class CustomerServiceImpl implements CustomerService{
	
	private CustomerDao customerDao;	
	
	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	@Override
	public void save(Map<String, String> data) {
		CustomerModel customer = new CustomerModel();
		customer.setName(data.get("name"));
		customer.setAddress(data.get("address"));
		customer.setPhone(data.get("phone"));
		customer.setNote(data.get("note"));
		customerDao.save(customer);
		
	}

	@Override
	public DataTableJson getListCustomer(String sort, String order, int limit, int offset) {
		DataTableJson dataTableJson = new DataTableJson();
		List<Object> lsObj = new ArrayList<>(); 
		lsObj = customerDao.getListCustomer(sort, order, limit, offset);
		
		dataTableJson.setTotalRow((long)lsObj.get(lsObj.size() - 1));
		lsObj.remove(lsObj.size() - 1);
		dataTableJson.setStatus(DataTableJson.SUCCESS);
		dataTableJson.setRows(lsObj);
		
		return dataTableJson;
	}

}
