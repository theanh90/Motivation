package com.theanh.first.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
