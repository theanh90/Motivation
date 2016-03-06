package com.theanh.first.dao;

import java.util.List;

import com.theanh.first.model.ProductModel;
import com.theanh.first.model.ProductOutModel;

public interface ProductDao {
	ProductModel getByKey(Integer id); 
	ProductModel findByName(String userName);
	Integer save(ProductModel product);
    void update(ProductModel product);
    void delete(ProductModel product);
	List<Object> getListCustomer(String sort, String order, int limit, int offset, String typeSearch, String textSearch);
	ProductOutModel getProductOutById(Integer pid);

}
