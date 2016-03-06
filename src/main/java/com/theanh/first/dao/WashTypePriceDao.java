package com.theanh.first.dao;

import com.theanh.first.model.WashTypePriceModel;

public interface WashTypePriceDao {
	WashTypePriceModel getByKey(Integer id); 
	WashTypePriceModel findByName(String userName);
	Integer save(WashTypePriceModel typePrice);
    void update(WashTypePriceModel typePrice);
    void delete(WashTypePriceModel typePrice);

}
