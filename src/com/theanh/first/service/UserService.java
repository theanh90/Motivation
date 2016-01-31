package com.theanh.first.service;

import com.theanh.first.model.User;

public interface UserService {
	
	User findById(int id); 
	
    User findByUserName(String name);

}
