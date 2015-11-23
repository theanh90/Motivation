package com.theanh.first.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.theanh.first.dao.UserDao;
import com.theanh.first.dao.UserDaoImpl;
import com.theanh.first.model.User;

@RestController
@RequestMapping(value="/rest")
public class TestRestController {
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public List<User> list() {
		List<User> resList = new ArrayList<User>();
		resList = userDao.listUser();
		return resList;
	}

}
