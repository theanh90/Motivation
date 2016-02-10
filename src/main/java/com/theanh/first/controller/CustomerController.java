package com.theanh.first.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theanh.first.service.CustomerService;
import com.theanh.first.service.UserService;

@Controller
@RequestMapping(value = "/api/customer")
public class CustomerController  extends BaseController{
	
	@Autowired
	CustomerService customerService;
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public String addCustomer(HttpServletRequest request, @RequestBody Map<String, String> data) {
		System.out.println("hello co ba" + data);
		
		if (!this.hasLogin())
			return null;
		
		try {
			customerService.save(data);
			
		}catch (Exception ex) {
			ex.printStackTrace();			
		}
		
		return null;
	}
	
}
