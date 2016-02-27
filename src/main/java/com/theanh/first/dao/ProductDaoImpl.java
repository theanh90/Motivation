package com.theanh.first.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.stereotype.Repository;

import com.theanh.first.model.ProductModel;
import com.theanh.first.model.ProductOutModel;

@Repository("productDao")
public class ProductDaoImpl extends AbstractDao<Integer, ProductModel> implements ProductDao {

	@Override
	public ProductModel getByKey(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductModel findByName(String userName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getListCustomer(String sort, String order, int limit, int offset, String typeSearch,
			String textSearch) {
		List<Object> lsResult = new ArrayList<>();
		String sql = "select A.pid, A.enName, A.vnName, A.unit, A.note, B.laundry, B.dryclean, B.pressonly " +
					"FROM Product A, WashTypePrice B WHERE 1=1 ";
		String condition = "";
		if (textSearch != null && textSearch != "") {
			if (typeSearch.equals("all")) {
				condition += " and ( ";
				condition += "A.enName like :textSearch ";
				condition += "or A.vnName like :textSearch ";
				condition += "or A.unit = :textSearch ";
				condition += "or A.note like :textSearch ";
				condition += ") ";
			} else {
				condition += "and A." + typeSearch + " like :textSearch ";
			}		
		}
		condition += "and A.pid = B.pid ";
		
		sql += condition;
		if (sort != null) {
			sql += " ORDER BY A." + sort + " " + order;
		}
		SQLQuery query = this.getSession().createSQLQuery(sql); 
		
		if (textSearch != null && textSearch != "") {
			query.setParameter("textSearch", "%" + textSearch + "%");
		}
		
		query.setResultTransformer(Transformers.aliasToBean(ProductOutModel.class));
		
		Long totalRow = (long)query.list().size();
		query.setMaxResults(limit);
		query.setFirstResult(offset);
		
		lsResult = query.list();
		lsResult.add(totalRow);
		
		return lsResult;
	}

	@Override
	public Integer save(ProductModel product) {
		return super.save(product);
	}

}
