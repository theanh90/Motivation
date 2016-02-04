package com.theanh.first.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
 
import com.theanh.first.model.User;
 
@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {
 
	@Override
    public User findById(int id) {
        return getByKey(id);
    }
 
    @Override
    public User findByUserName(String userName) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("userName", userName));
        return (User) crit.uniqueResult();
    }
    
    @Override
    public void save(User entity) {
    	this.getSession().save(entity);
    }

    
}
 
     
