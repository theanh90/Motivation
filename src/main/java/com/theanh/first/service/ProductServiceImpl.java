package com.theanh.first.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.ProductDao;
import com.theanh.first.dao.WashTypePriceDao;
import com.theanh.first.model.CustomerModel;
import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.ProductModel;
import com.theanh.first.model.ProductOutModel;
import com.theanh.first.model.WashTypePriceModel;

@Transactional
public class ProductServiceImpl  implements ProductService{
	
	private ProductDao productDao;
	private WashTypePriceDao washTypePriceDao;

	public WashTypePriceDao getWashTypePriceDao() {
		return washTypePriceDao;
	}

	public void setWashTypePriceDao(WashTypePriceDao washTypePriceDao) {
		this.washTypePriceDao = washTypePriceDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public void save(Map<String, String> data) {
		ProductModel product = new ProductModel();
		WashTypePriceModel typePrice = new WashTypePriceModel();
		
		product.setEnName(data.get("nameEn"));
		product.setVnName(data.get("nameVn"));
		product.setUnit(data.get("unit"));
		product.setNote(data.get("note"));
		product.setActive(1);
		Integer productId = productDao.save(product);
		
		typePrice.setDryClean(Integer.parseInt(data.get("dryclean")));
		typePrice.setLaundry(Integer.parseInt(data.get("laundry")));
		typePrice.setPressOnly(Integer.parseInt(data.get("pressonly")));
		typePrice.setPid(productId);
		
		washTypePriceDao.save(typePrice);
		
	}

	@Override
	public DataTableJson getListProductOut(String sort, String order, Integer limit, int offset, String typeSearch,
			String textSearch) {
		DataTableJson dataTableJson = new DataTableJson();
		List<Object> lsObj = new ArrayList<>(); 
		lsObj = productDao.getListCustomer(sort, order, limit, offset, typeSearch, textSearch);
		
		dataTableJson.setTotal((long)lsObj.get(lsObj.size() - 1));
		lsObj.remove(lsObj.size() - 1);
		dataTableJson.setStatus(DataTableJson.SUCCESS);
		dataTableJson.setRows(lsObj);
		
		return dataTableJson;
	}

	@Override
	public void delete(Integer pid) {
		ProductModel product = new ProductModel();
		product = productDao.getByKey(pid);
		product.setActive(0);
		productDao.update(product);
//		productDao.delete(product);
		
//		WashTypePriceModel typePrice = new WashTypePriceModel();
//		typePrice = washTypePriceDao.getByKey(pid);
//		washTypePriceDao.delete(typePrice);
	}

	@Override
	public ProductModel getProductById(Integer pid) {
		ProductModel product = new ProductModel();
		product = productDao.getByKey(pid);
		return product;
	}

	@Override
	public void edit(Map<String, String> data) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ProductOutModel getProductOutById(Integer pid) {
		ProductOutModel productOut = new ProductOutModel();
		productOut = productDao.getProductOutById(pid);
		
		return productOut;
		
	}

	@Override
	public void editProductOut(Map<String, String> data) {
		ProductModel product = new ProductModel(); 
		product = productDao.getByKey(Integer.parseInt(data.get("id")));
		product.setEnName(data.get("nameEn"));
		product.setVnName(data.get("nameVn"));
		product.setUnit(data.get("unit"));
		product.setNote(data.get("note"));		
		productDao.update(product);
		
		WashTypePriceModel typePrice = new WashTypePriceModel();
		typePrice = washTypePriceDao.getByKey(Integer.parseInt(data.get("id")));
		typePrice.setDryClean(Integer.parseInt(data.get("dryclean")));
		typePrice.setLaundry(Integer.parseInt(data.get("laundry")));
		typePrice.setPressOnly(Integer.parseInt(data.get("pressonly")));		
		washTypePriceDao.update(typePrice);
	}


}
