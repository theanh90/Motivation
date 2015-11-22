package com.theanh.first.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.theanh.first.dao.User;

@Controller
public class TestController {

	@RequestMapping(value = "/hello")
	public ModelAndView sayHello() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", "Hello Reader!");
		mv.setViewName("helloReader");
		return mv;
	}

}
