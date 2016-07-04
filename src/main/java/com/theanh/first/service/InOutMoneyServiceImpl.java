package com.theanh.first.service;

import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.InOutMoneyDao;
import com.theanh.first.model.InOutMoneyInModel;
import com.theanh.first.model.InOutMoneyModel;

@Transactional
public class InOutMoneyServiceImpl implements InOutMoneyService{
	public final static Integer INOUT_TYPE_PUT = 1;
	public final static Integer INOUT_TYPE_WITHDRAW = 0;
	
	private InOutMoneyDao inOutMoneyDao;

	public InOutMoneyDao getInOutMoneyDao() {
		return inOutMoneyDao;
	}

	public void setInOutMoneyDao(InOutMoneyDao inOutMoneyDao) {
		this.inOutMoneyDao = inOutMoneyDao;
	}

	@Override
	public void save(InOutMoneyInModel data) {
		InOutMoneyModel inoutMoney = new InOutMoneyModel();
		
		inoutMoney.setDateCreate(data.getDateCreate());
		inoutMoney.setReason(data.getReason());
		inoutMoney.setWho(data.getWho());
		if (data.getType().equals("put")) {
			inoutMoney.setType(INOUT_TYPE_PUT);
			inoutMoney.setMoney(data.getMoney());
		} else {
			inoutMoney.setType(INOUT_TYPE_WITHDRAW);
			inoutMoney.setMoney(-data.getMoney());
		}
		
		inOutMoneyDao.save(inoutMoney);
	}
	
}
