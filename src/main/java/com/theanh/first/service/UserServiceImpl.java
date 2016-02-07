package com.theanh.first.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.UserDao;
import com.theanh.first.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	
	@Autowired
    private UserDao useDao;
	
	@Autowired
    private PasswordEncoder passwordEncoder;
 
	@Override
    public User findById(int id) {
        return useDao.findById(id);
    }
    
    @Override
    public User findByUserName(String userName) {
        return useDao.findByUserName(userName);
    }

	@Override
	public void save(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		useDao.save(user);		
	}

}
