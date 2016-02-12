package com.theanh.first.dao;

import java.util.List;

import com.theanh.first.model.CustomerModel;

public interface CustomerDao {
	CustomerModel findById(int id);    
	CustomerModel findByName(String userName);
    void save(CustomerModel customer);
    void update(CustomerModel customer);
	List<Object> getListCustomer(String sort, String order, int limit, int offset);
}
