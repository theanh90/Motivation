package com.theanh.first.dao;

import org.springframework.stereotype.Repository;

import com.theanh.first.model.CustomerModel;

@Repository("customerDao")
public class CustomerDaoImpl extends AbstractDao<Integer, CustomerModel> implements CustomerDao{

	@Override
	public CustomerModel findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerModel findByName(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(CustomerModel customer) {
		super.save(customer);
	}

	@Override
	public void update(CustomerModel customer) {
		// TODO Auto-generated method stub
		
	}

}
