package com.theanh.first.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theanh.first.model.CustomerModel;
import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.JsonResponse;
import com.theanh.first.service.CustomerService;

@Controller
@RequestMapping(value = "/api/customer")
public class CustomerController  extends BaseController{
	
	@Autowired
	CustomerService customerService;
	
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public DataTableJson getListCustomer(HttpServletRequest request, @RequestParam(value = "sort", required = false) String sort,
			@RequestParam String order, @RequestParam int limit, @RequestParam int offset) {		
		DataTableJson dataTableJson;
		
		if (!this.hasLogin())
			return null;
		
		try {
			dataTableJson = customerService.getListCustomer(sort, order, limit, offset);
		}catch (Exception ex) {
			ex.printStackTrace();
			dataTableJson = new DataTableJson(DataTableJson.ERROR, "Fail to load list customer");
		}
		
		return dataTableJson;
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.GET, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse getCustomerById(HttpServletRequest request, @RequestParam Integer cusId) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			CustomerModel customer = customerService.getCustomerById(cusId);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Save Customer successfully!", customer);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to save Customer!", null);
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse addCustomer(HttpServletRequest request, @RequestBody Map<String, String> data) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			customerService.save(data);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Save Customer successfully!", null);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to save Customer!", null);
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.PUT, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse editCustomer(HttpServletRequest request, @RequestBody Map<String, String> data) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			customerService.edit(data);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Update Customer successfully!", null);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to update Customer!", null);
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.DELETE, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse deleteCustomer(HttpServletRequest request, @RequestParam Integer cusId) {
		JsonResponse jsonResponse;
		
		if (!this.hasLogin())
			return null;
		
		try {
			customerService.delete(cusId);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Delete Customer successfully!", null);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to delete Customer!", null);
		}
		
		return jsonResponse;
	}
	
}
