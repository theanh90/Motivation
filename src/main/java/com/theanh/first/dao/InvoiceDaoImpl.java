package com.theanh.first.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.theanh.first.model.InvoiceModel;

@Repository("invoiceDao")
public class InvoiceDaoImpl extends AbstractDao<Integer, InvoiceModel> implements InvoiceDao{

	@Override
	public List<Object> getListInvoiceCustomer(String sort, String order, int limit, int offset, String typeSearch, String textSearch) {		
		List<Object> lsResult = new ArrayList<>();
		String sql = "FROM InvoiceCustomerViewModel WHERE 1=1 ";
		String condition = "";
		if (textSearch != null && textSearch != "") {
			if ("all".equals(typeSearch)) {
				condition += " and ( ";
				condition += "name like :textSearch ";
//				condition += "or phone like :textSearch ";
//				condition += "or email like :textSearch ";
//				condition += "or address like :textSearch ";
				condition += "or note like :textSearch ";
				condition += ") ";
			} else if ("id".equals(typeSearch)) {
				condition += " and inId = :textSearch ";
			} else if ("date".equals(typeSearch)) {
				// handle for date search
			} else {
				condition += "and " + typeSearch + " like :textSearch ";
			}		
		}
		condition += "and active = 1 ";
		
		sql += condition;
		if (sort != null) {
			sql += " ORDER BY " + sort + " " + order;
		}
		Query query = this.getSession().createQuery(sql); 
		
		if ("id".equals(typeSearch) && (textSearch != null && textSearch != "")){
			Integer id = 0;
			try {
				id = Integer.parseInt(textSearch);
			} catch (NumberFormatException ex) {
				logger.info("Fail to parse textSearch to Integer: \"" + textSearch + "\"");
				id = 0;
			}
			query.setParameter("textSearch", id);
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
