package com.theanh.first.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.theanh.first.model.CustomerModel;

@Repository("customerDao")
public class CustomerDaoImpl extends AbstractDao<Integer, CustomerModel> implements CustomerDao{

	@Override
	public CustomerModel getByKey(int id) {
		return super.getByKey(id);
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
		super.update(customer);
	}

	@Override
	public List<Object> getListCustomer(String sort, String order, int limit, int offset) {
		List<Object> lsResult = new ArrayList<>();
		String sql = "FROM CustomerModel WHERE 1=1 ";
		if (sort != null) {
			sql += " ORDER BY " + sort + " " + order;
		}
		Query query = this.getSession().createQuery(sql); 
		
		Long totalRow = (long)query.list().size();
		query.setMaxResults(limit);
		query.setFirstResult(offset);
		
		lsResult = query.list();
		lsResult.add(totalRow);
		
		return lsResult;
	}

}
