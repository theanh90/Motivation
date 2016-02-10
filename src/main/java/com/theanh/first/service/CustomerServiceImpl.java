package com.theanh.first.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.CustomerDao;
import com.theanh.first.dao.UserDao;
import com.theanh.first.model.CustomerModel;

@Transactional
//@Service("customerService")
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
		
//		User user = new User(3, "aaa", "aa", "ROLE_USER");
//		userDao.save(user);
	}

}
