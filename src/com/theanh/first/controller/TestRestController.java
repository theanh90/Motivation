package com.theanh.first.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.theanh.first.dao.User;

@RestController
@RequestMapping(value="/rest")
public class TestRestController {

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public List<User> list() {
		List<User> resList = new ArrayList<User>();
		resList.add(new User(01, "Admin"));
		resList.add(new User(02, "Mod"));
		return resList;
	}

}
