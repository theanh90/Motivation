package com.theanh.first.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.theanh.first.model.ProductModel;
import com.theanh.first.model.ProductOutModel;

@Repository("productDao")
public class ProductDaoImpl extends AbstractDao<Integer, ProductModel> implements ProductDao {

	@Override
	public ProductModel findByName(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getListCustomer(String sort, String order, Integer limit, int offset, String typeSearch,
			String textSearch) {
		List<Object> lsResult = new ArrayList<>();
		String sql = "SELECT A.pid, A.enName, A.vnName, A.unit, A.note, A.active, B.laundry, B.dryclean, B.pressonly " +
					"FROM Product A, WashTypePrice B WHERE 1=1 ";
		String condition = "";
		if (textSearch != null && textSearch != "") {
			if ("all".equals(typeSearch)) {
				condition += " AND ( ";
				condition += "A.enName like :textSearch ";
				condition += "OR A.vnName like :textSearch ";
				condition += "OR A.unit = :textSearch ";
				condition += "OR A.note like :textSearch ";
				condition += ") ";
			} else if ("id".equals(typeSearch)) {
				condition += "AND A.pid = :textSearch ";
			} else {
				condition += "AND A." + typeSearch + " LIKE :textSearch ";
			}		
		}
		condition += "AND A.pid = B.pid ";
		condition += "AND A.active = 1";
		
		sql += condition;
		if (sort != null) {
			sql += " ORDER BY A." + sort + " " + order;
		}
		SQLQuery query = this.getSession().createSQLQuery(sql); 
		
		if ("id".equals(typeSearch)) {
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
		
		query.setResultTransformer(Transformers.aliasToBean(ProductOutModel.class));
		
		Long totalRow = (long)query.list().size();
		if (limit != null) {
			query.setMaxResults(limit);
		}
		query.setFirstResult(offset);
		
		lsResult = query.list();
		lsResult.add(totalRow);
		
		return lsResult;
	}

	@Override
	public ProductOutModel getProductOutById(Integer pid) {
		ProductOutModel productOut = new ProductOutModel();
		String sql = "SELECT A.pid, A.enName, A.vnName, A.unit, A.note, B.laundry, B.dryclean, B.pressonly " +
				"FROM Product A, WashTypePrice B WHERE 1=1 and A.pid = B.pid and A.pid = :pid  and A.active = 1 ";

		SQLQuery query = this.getSession().createSQLQuery(sql);
		query.setParameter("pid", pid);
		query.setResultTransformer(Transformers.aliasToBean(ProductOutModel.class));
		
		productOut = (ProductOutModel)query.uniqueResult();
		
		return productOut;
	}
	

}
