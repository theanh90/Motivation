package com.theanh.first.dao;

import org.springframework.stereotype.Repository;

import com.theanh.first.model.CustomerModel;
import com.theanh.first.model.InOutMoneyModel;

@Repository("inOutMoneyDao")
public class InOutMoneyDaoImpl extends AbstractDao<Integer, InOutMoneyModel> implements InOutMoneyDao {

	

}
