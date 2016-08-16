package com.theanh.first.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theanh.first.model.DataTableJson;
import com.theanh.first.model.InOutMoneyInModel;
import com.theanh.first.model.JsonResponse;
import com.theanh.first.service.InOutMoneyService;

@Controller
@RequestMapping(value = "/api/inout")
public class InOutMoneyController extends BaseController {
	@Autowired
	InOutMoneyService inOutMoneyService;

	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse addCustomer(HttpServletRequest request, @RequestBody InOutMoneyInModel data) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			inOutMoneyService.save(data);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Save Customer successfully!", null);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to save Customer!", null);
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public DataTableJson getListInOutMoney(HttpServletRequest request, @RequestParam(value = "sort", required = false) String sort,
			@RequestParam String order, @RequestParam int limit, @RequestParam int offset, @RequestParam String typeSearch, 
			@RequestParam String textSearch) {		
		DataTableJson dataTableJson;
		
		if (!this.hasLogin())
			return null;
		
		try {
			dataTableJson = inOutMoneyService.getListInOutMoney(sort, order, limit, offset, typeSearch, textSearch);
		}catch (Exception ex) {
			ex.printStackTrace();
			dataTableJson = new DataTableJson(DataTableJson.ERROR, "Fail to load list In/Out money");
		}
		
		return dataTableJson;
	}
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.DELETE, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse deleteInOutMoney(HttpServletRequest request, @RequestParam Integer id, @RequestParam String whoCancel) {
		JsonResponse jsonResponse;
		
		if (!this.hasLogin())
			return null;
		
		try {
			inOutMoneyService.deleteInOutMoney(id, whoCancel);
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Delete Customer successfully!", null);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to delete Customer!", null);
		}
		
		return jsonResponse;
	}

}
