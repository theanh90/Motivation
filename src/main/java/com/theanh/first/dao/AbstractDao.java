package com.theanh.first.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.theanh.first.controller.BaseController;

public class AbstractDao<PK extends Serializable, T>  {
	protected static final Logger logger = Logger.getLogger(AbstractDao.class);
	private final Class<T> persistentClass;
	
	@Autowired
    private SessionFactory sessionFactory;

	public Class<T> getPersistentClass() {
		return persistentClass;
	}

	@SuppressWarnings("unchecked")
    public AbstractDao(){
        this.persistentClass =(Class<T>) (
        		(ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
    }
     
    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }
 
    @SuppressWarnings("unchecked")
    public T getByKey(PK key) {
        return (T) getSession().get(persistentClass, key);
    }
 
    public void persist(T entity) {
        getSession().persist(entity);
    }
 
    public void delete(T entity) {
        getSession().delete(entity);
    }
    
    @SuppressWarnings("unchecked")
	public PK save(T entity) {
    	return (PK)getSession().save(entity);    	
    }
    
    public void update(T entity) {
    	getSession().update(entity);
    }
     
    protected Criteria createEntityCriteria(){
        return getSession().createCriteria(persistentClass);
    }
 
}
