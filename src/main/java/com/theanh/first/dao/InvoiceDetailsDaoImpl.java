package com.theanh.first.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.theanh.first.model.InvoiceDetailsModel;

@Repository("invoiceDetailsDao")
public class InvoiceDetailsDaoImpl extends AbstractDao<Integer, InvoiceDetailsModel> implements InvoiceDetailsDao{

	@Override
	public void deleteByInvoiceId(Integer invoiceId) {
		String sql = "delete InvoiceDetailsModel where inId = :invoiceId ";
		Query query = this.getSession().createQuery(sql);
		query.setParameter("invoiceId", invoiceId);
		
		query.executeUpdate();		
	}

}
