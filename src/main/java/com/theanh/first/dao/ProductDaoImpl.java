package com.theanh.first.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.theanh.first.model.ProductModel;

@Repository("productDao")
public class ProductDaoImpl extends AbstractDao<Integer, ProductModel> implements ProductDao {

	@Override
	public ProductModel getByKey(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductModel findByName(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getListCustomer(String sort, String order, int limit, int offset, String typeSearch,
			String textSearch) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer save(ProductModel product) {
		return super.save(product);
	}

}
