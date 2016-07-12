package com.theanh.first.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theanh.first.model.JsonResponse;
import com.theanh.first.service.AdminService;

@Controller
@RequestMapping(value = "/api/admin")
public class AdminController extends BaseController{
	@Autowired
	AdminService adminService;
	
	@ResponseBody
	@RequestMapping(value = "/resetpwd", method = RequestMethod.POST, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse resetPassword(HttpServletRequest request, @RequestBody Map<String, String> data) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		//get list role
		List<GrantedAuthority> roles = this.getUserRoles();
		if (roles.get(0).getAuthority().equals("ROLE_ADMIN")) {			
			try {
				Boolean result = adminService.resetPassword(data);
				jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Rest pasword successfully!", null);
				if (result == true) {
					jsonResponse.setData(1);
				} else {
					jsonResponse.setData(0);
				}
			}catch (Exception ex) {
				ex.printStackTrace();
				jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to reset password Customer!", null);
			}
		} else {
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Only Admin can reset password!!!", null);
		}
		
		return jsonResponse;
	}
}
