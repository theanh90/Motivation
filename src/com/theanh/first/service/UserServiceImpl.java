package com.theanh.first.service;

//import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.UserDao;
import com.theanh.first.model.User;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
    private UserDao dao;
 
    public User findById(int id) {
        return dao.findById(id);
    }
 
    public User findByUserName(String userName, String password) {
        return dao.findByUserName(userName, password);
    }

}
