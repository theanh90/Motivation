package com.theanh.first.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.InOutMoneyDao;
import com.theanh.first.model.DataTableJson;
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
			inoutMoney.setMoney(data.getMoney());
		}
		inoutMoney.setActive(1);
		
		inOutMoneyDao.save(inoutMoney);
	}

	@Override
	public DataTableJson getListInOutMoney(String sort, String order, int limit, int offset, 
			String typeSearch, String textSearch) {

		DataTableJson dataTableJson = new DataTableJson();
		List<Object> lsObj = new ArrayList<>(); 
		lsObj = inOutMoneyDao.getListCustomer(sort, order, limit, offset, typeSearch, textSearch);
		
		dataTableJson.setTotal((long)lsObj.get(lsObj.size() - 1));
		lsObj.remove(lsObj.size() - 1);
		dataTableJson.setStatus(DataTableJson.SUCCESS);
		dataTableJson.setRows(lsObj);
		
		return dataTableJson;
	}

	@Override
	public void deleteInOutMoney(Integer id, String whoCancel) {
		InOutMoneyModel inoutMoney = new InOutMoneyModel();
		inoutMoney = inOutMoneyDao.getByKey(id);
		
		inoutMoney.setDateCancel(new Date());
		inoutMoney.setWhoCancel(whoCancel);
		inoutMoney.setActive(0);
		
		inOutMoneyDao.save(inoutMoney);		
	}
	
}
