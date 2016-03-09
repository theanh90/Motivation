package com.theanh.first.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.CustomerDao;
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
		customer.setEmail(data.get("email"));
		customer.setNote(data.get("note"));
		customer.setActive(1);
		customerDao.save(customer);
		
	}

	@Override
	public DataTableJson getListCustomer(String sort, String order, int limit, int offset, String typeSearch, String textSearch) {
		DataTableJson dataTableJson = new DataTableJson();
		List<Object> lsObj = new ArrayList<>(); 
		lsObj = customerDao.getListCustomer(sort, order, limit, offset, typeSearch, textSearch);
		
		dataTableJson.setTotal((long)lsObj.get(lsObj.size() - 1));
		lsObj.remove(lsObj.size() - 1);
		dataTableJson.setStatus(DataTableJson.SUCCESS);
		dataTableJson.setRows(lsObj);
		
		return dataTableJson;
	}

	@Override
	public void delete(Integer cusId) {
		CustomerModel customer = new CustomerModel();
		customer = customerDao.getByKey(cusId);
		customer.setActive(0);
		customerDao.update(customer);
//		customerDao.delete(customer);
	}

	@Override
	public CustomerModel getCustomerById(Integer cusId) {
		CustomerModel customer = new CustomerModel();
		customer = customerDao.getByKey(cusId);
		
		return customer;
	}

	@Override
	public void edit(Map<String, String> data) {
		CustomerModel customer = new CustomerModel();
		customer = customerDao.getByKey(Integer.parseInt(data.get("id")));
		
		customer.setName(data.get("name"));
		customer.setPhone(data.get("phone"));
		customer.setEmail(data.get("email"));
		customer.setAddress(data.get("address"));
		customer.setNote(data.get("note"));
		
		customerDao.update(customer);
		
	}

}
