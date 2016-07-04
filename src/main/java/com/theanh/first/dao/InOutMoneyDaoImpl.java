package com.theanh.first.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.theanh.first.model.InOutMoneyModel;

@Repository("inOutMoneyDao")
public class InOutMoneyDaoImpl extends AbstractDao<Integer, InOutMoneyModel> implements InOutMoneyDao {

	@Override
	public List<Object> getListCustomer(String sort, String order, int limit, int offset, 
			String typeSearch, String textSearch) {

		List<Object> lsResult = new ArrayList<>();
		String sql = "FROM InOutMoneyModel WHERE 1=1 ";
		String condition = "";
		if (textSearch != null && textSearch != "") {
			if ("all".equals(typeSearch)) {
				condition += " and ( ";
				condition += "who like :textSearch ";
				condition += "or reason like :textSearch ";
				condition += ") ";
			} else if ("type".equals(typeSearch)) {
				condition += " and type = :textSearch ";
			} else {
				condition += "and " + typeSearch + " like :textSearch ";
			}		
		}
//		condition += "and active = 1 ";
		
		sql += condition;
		if (sort != null) {
			sql += " ORDER BY " + sort + " " + order;
		}
		Query query = this.getSession().createQuery(sql); 
		
		if ("type".equals(typeSearch)){
			Integer type = -1;
			try {
				type = Integer.parseInt(textSearch);
			} catch (NumberFormatException ex) {
				logger.info("Fail to parse textSearch to Integer: \"" + textSearch + "\"");
				type = -1;
			}
			query.setParameter("textSearch", type);
		} else if (textSearch != null && textSearch != "") {
			query.setParameter("textSearch", "%" + textSearch + "%");
		}
		
		Long totalRow = (long)query.list().size();
		query.setMaxResults(limit);
		query.setFirstResult(offset);
		
		lsResult = query.list();
		lsResult.add(totalRow);
		
		return lsResult;
	}
	
}
