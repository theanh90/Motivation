package com.theanh.first.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;


@Controller
public class BaseController {
	protected static final Logger logger = Logger.getLogger(BaseController.class);
    
	public Boolean hasLogin() {
		Boolean result = false;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null)
			result = true;
		
		return result;		
	}
	
	@SuppressWarnings("unchecked")
	public List<GrantedAuthority> getUserRoles() {
		return (List<GrantedAuthority>)SecurityContextHolder.getContext().getAuthentication().getAuthorities();
	}

}