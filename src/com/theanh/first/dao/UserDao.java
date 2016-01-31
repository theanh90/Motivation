package com.theanh.first.dao;

import com.theanh.first.model.User;

public interface UserDao {
	User findById(int id);    
    User findByUserName(String userName);
}
