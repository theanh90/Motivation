package com.theanh.first.dao;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("homeDao")
public class HomeDaoImpl implements HomeDao{
	@Autowired
    private SessionFactory sessionFactory;
    
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Object getInvoiceReport(Date startDate, Date endDate) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT COUNT(I.InId) InvoiceCount, SUM(I.TotalPrice) TotalPrice, SUM(I.TotalPay) TotalPay, SUM(I.TotalPrice - I.TotalPay) TotalDue ");
		sql.append("FROM invoice I WHERE 1 = 1 AND ( ");
		sql.append("I.LastStatus <> -1 ");
		sql.append("AND DateCreate BETWEEN :startDate AND :endDate ");
		sql.append(")");
		
		Query query = this.getSession().createSQLQuery(sql.toString());
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		
		Object result = (Object)query.uniqueResult();
		
		return result;
	}

	@Override
	public Object getInOutReport(Date startDate, Date endDate) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT SUM(CASE WHEN M.Type = 1 THEN M.Money ELSE 0 END) Put, ");
		sql.append("SUM(CASE WHEN M.Type = 0 THEN M.Money ELSE 0 END) Withdraw ");
		sql.append("FROM InOutMoney M ");
		sql.append("WHERE M.Active = 1 ");
		sql.append("AND M.DateCreate BETWEEN :startDate AND :endDate");
		
		Query query = this.getSession().createSQLQuery(sql.toString());
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		
		Object result = (Object)query.uniqueResult();
		
		return result;
	}

	@Override
	public Object getLeftTotalMoney() {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT SUM(TotalTable.Money) ");
		sql.append("FROM ( ");
		sql.append("SELECT SUM(I.TotalPay) Money ");
		sql.append("FROM Invoice I ");
		sql.append("WHERE I.LastStatus <> -1 ");
		sql.append("UNION ");
		sql.append("SELECT SUM(case when M.Type = 1 then M.Money else -M.Money end) Money ");
		sql.append("FROM InOutMoney M ");
		sql.append("WHERE M.Active = 1 ");
		sql.append(") TotalTable");
		
		Query query = this.getSession().createSQLQuery(sql.toString());
		
		Object result = (Object)query.uniqueResult();
		
		return result;
	}

}
