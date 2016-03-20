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

import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.JsonResponse;
import com.theanh.first.model.ProductModel;
import com.theanh.first.model.ProductOutModel;
import com.theanh.first.service.ProductService;

@Controller
@RequestMapping(value = "/api/product")
public class ProductController extends BaseController{
	
	@Autowired
	ProductService productService;
	
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public DataTableJson getListProduct(HttpServletRequest request, @RequestParam(value = "sort", required = false) String sort,
			@RequestParam String order, @RequestParam(value = "limit", required = false) Integer limit, @RequestParam int offset, 
			@RequestParam String typeSearch, @RequestParam String textSearch) {		
		DataTableJson dataTableJson;
		
		if (!this.hasLogin())
			return null;
		
		try {
			dataTableJson = productService.getListProductOut(sort, order, limit, offset, typeSearch, textSearch);
		}catch (Exception ex) {
			ex.printStackTrace();
			dataTableJson = new DataTableJson(DataTableJson.ERROR, "Fail to load list Product");
		}
		
		return dataTableJson;
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.GET, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse getProductOutById(HttpServletRequest request, @RequestParam Integer pid) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			ProductOutModel customer = productService.getProductOutById(pid);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Get Product out model successfully!", customer);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to get Product out model!", null);
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
			productService.editProductOut(data);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Update Product Out successfully!", null);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to update Product Out!", null);
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
			productService.save(data);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Save Product successfully!", null);
			logger.info("Save Product successfully");
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to save Product!", null);
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.DELETE, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse deleteProduct(HttpServletRequest request, @RequestParam Integer pid) {
		JsonResponse jsonResponse;
		
		if (!this.hasLogin())
			return null;
		
		try {
			productService.delete(pid);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Delete Product successfully!", null);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to Product Customer!", null);
		}
		
		return jsonResponse;
	}

}
