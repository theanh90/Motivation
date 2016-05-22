package com.theanh.first.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.theanh.first.model.InvoiceDetailCustomerViewModel;
import com.theanh.first.model.InvoiceModel;

@Repository("invoiceDao")
public class InvoiceDaoImpl extends AbstractDao<Integer, InvoiceModel> implements InvoiceDao{
	
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/YYYY");

	@Override
	public List<Object> getListInvoiceCustomer(String sort, String order, int limit, int offset, String typeSearch, 
			String textSearch, Integer statusType, Long from, Long to) throws ParseException {		
		List<Object> lsResult = new ArrayList<>();
		String sql = "FROM InvoiceCustomerViewModel WHERE 1=1 ";
		String condition = "";
		
		if ("status".equals(typeSearch)) {
			condition += " AND lastStatus = :statusType ";
		} else if (textSearch != null && textSearch != "") {
			if ("all".equals(typeSearch)) {
				condition += " AND ( ";
				condition += "name LIKE :textSearch ";
				condition += "OR note LIKE :textSearch ";
				condition += ") ";
			} else if ("id".equals(typeSearch)) {
				condition += " AND inId = :textSearch ";
			} else {
				condition += "AND  " + typeSearch + " like :textSearch ";
			}		
		}
		if (from != null || to != null) {
			condition += "AND dateCreate BETWEEN :from and :to ";			
		}
		
		condition += "and active = 1 ";
		
		sql += condition;
		if (sort != null) {
			sql += " ORDER BY " + sort + " " + order;
		}
		Query query = this.getSession().createQuery(sql); 
		
		if ("status".equals(typeSearch)) {
			query.setParameter("statusType", statusType);
		} else if ("id".equals(typeSearch) && (textSearch != null && textSearch != "")){
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
		
		if (from != null || to != null) {
			if (from != null && to != null) {
				query.setDate("from", new Date(from * 1000));
				query.setDate("to", new Date((to + 86399) * 1000));
			} else if (from != null) {
				query.setDate("from", new Date(from * 1000));
				query.setDate("to", new Date((from + 86399) * 1000));
			} else {
				query.setDate("from", new Date(to * 1000));
				query.setDate("to", new Date((to + 86399) * 1000));
			}
			
		}
		
		Long totalRow = (long)query.list().size();
		query.setMaxResults(limit);
		query.setFirstResult(offset);
		
		lsResult = query.list();
		lsResult.add(totalRow);
		
		return lsResult;
	}

	@Override
	public List<InvoiceDetailCustomerViewModel> getById(Integer id) {
		List<InvoiceDetailCustomerViewModel> results = new ArrayList<>();
		String sql = "from InvoiceDetailCustomerViewModel where id.inId = :id ";
		Query query = this.getSession().createQuery(sql);
		
		query.setParameter("id", id);		
		results = query.list();
		
		return results;
	}
	

}
