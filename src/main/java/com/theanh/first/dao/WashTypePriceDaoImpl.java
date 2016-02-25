package com.theanh.first.dao;

import org.springframework.stereotype.Repository;

import com.theanh.first.model.WashTypePriceModel;

@Repository("washTypePriceDao")
public class WashTypePriceDaoImpl extends AbstractDao<Integer, WashTypePriceModel> implements WashTypePriceDao{

	@Override
	public WashTypePriceModel getByKey(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public WashTypePriceModel findByName(String userName) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Integer save(WashTypePriceModel typePrice) {
		return super.save(typePrice);
	}

}
