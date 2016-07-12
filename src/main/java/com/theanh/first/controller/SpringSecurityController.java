package com.theanh.first.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SpringSecurityController extends BaseController {
	final static Logger logger = Logger.getLogger(SpringSecurityController.class);
	
	public SpringSecurityController() {
		logger.info("initialize Spring Security Controller");
	}

	@RequestMapping(value = { "/"}, method = RequestMethod.GET)
	public String homePage(ModelMap model, HttpServletRequest request) {		
		//get list role
		List<GrantedAuthority> roles = this.getUserRoles();
		if (roles.get(0).getAuthority().equals("ROLE_ADMIN")) {
			request.getSession().setAttribute("admin", "1");
		} else {
			request.getSession().setAttribute("admin", "0");
		}
		
		model.addAttribute("user", getPrincipal());
		
		return "homepage/index";
	}

	@RequestMapping(value = "/access_denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "access_denied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:login?logout";
	}
	
//	@RequestMapping(value = "/admin", method = RequestMethod.GET)
//	public String adminPage(ModelMap model) {
//		model.addAttribute("user", getPrincipal());
//		return "admin";
//	}
	
	@RequestMapping(value = "/staff", method = RequestMethod.GET)
	public String staffPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "staff";
	}

	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}
