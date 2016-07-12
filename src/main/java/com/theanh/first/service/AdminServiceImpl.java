package com.theanh.first.service;

import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import com.theanh.first.dao.AdminDao;
import com.theanh.first.dao.UserDao;
import com.theanh.first.model.User;

@Transactional
public class AdminServiceImpl implements AdminService{
	private AdminDao adminDao;
	private UserDao userDao;

	public AdminDao getAdminDao() {
		return adminDao;
	}

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public Boolean resetPassword(Map<String, String> data) {
		String username = data.get("usr");
		String password = data.get("pwd1");
		
		User user = userDao.findByUserName(username);
		if (user == null)
			return false;
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(password));
		
		userDao.update(user);
		
		return true;		
	}
}
