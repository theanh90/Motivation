package com.theanh.first.service;

import java.util.Map;

import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.ProductModel;
import com.theanh.first.model.ProductOutModel;

public interface ProductService {
	void save(Map<String, String> customer);
	DataTableJson getListProductOut(String sort, String order, Integer limit, int offset, String typeSearch, String textSearch);
	void delete(Integer cusId);
	ProductModel getProductById(Integer cusId);
	void edit(Map<String, String> data);
	void editProductOut(Map<String, String> data);
	ProductOutModel getProductOutById(Integer pid);
}
