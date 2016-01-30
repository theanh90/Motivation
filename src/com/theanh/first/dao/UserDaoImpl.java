package com.theanh.first.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
 
import com.theanh.first.model.User;
 
@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao {
 
    public User findById(int id) {
        return getByKey(id);
    }
 
    public User findByUserName(String userName, String password) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("userName", userName))
        	.add(Restrictions.eq("password", password));
        return (User) crit.uniqueResult();
    }
    
}
 
     
