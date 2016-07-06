package com.theanh.first.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theanh.first.model.JsonResponse;
import com.theanh.first.service.HomeService;

@Controller
@RequestMapping(value = "/api/home")
public class HomeController extends BaseController{
	@Autowired
	HomeService homeService;
	
	@ResponseBody
	@RequestMapping(value = "/report", method = RequestMethod.GET, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse report(HttpServletRequest request, @RequestParam Long start, @RequestParam Long end) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			Date startDate = new Date(start);
			Date endDate = new Date(end);
			Object result = homeService.getInvoiceReport(startDate, endDate);
			
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Get report data successfully", null);
			jsonResponse.setData(result);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to get report data!", null);
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(value = "/inoutreport", method = RequestMethod.GET, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse inoutReport(HttpServletRequest request, @RequestParam Long start, @RequestParam Long end) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			Date startDate = new Date(start);
			Date endDate = new Date(end);
			Object result = homeService.getInOutReport(startDate, endDate);
			
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Get report data successfully", null);
			jsonResponse.setData(result);
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to get report data!", null);
		}
		
		return jsonResponse;
	}

}
