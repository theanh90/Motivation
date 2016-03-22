package com.theanh.first.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.theanh.first.model.JsonResponse;
import com.theanh.first.model.inmodel.InvoiceDetailsInModel;
import com.theanh.first.model.inmodel.InvoiceInModel;
import com.theanh.first.service.InvoiceService;

@Controller
@RequestMapping(value = "/api/invoice")
public class InvoiceController extends BaseController {
	@Autowired
	private InvoiceService invoiceService;
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.POST, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse addInvoice(HttpServletRequest request, @RequestBody Map<String, InvoiceInModel> data) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			System.out.println("da vao controller");
			
			invoiceService.save(data.get("invoice"));
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Save Invoice successfully!", null);
			logger.info("Save Invoice successfully");
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to save Invoice!", null);
		}
		
		return jsonResponse;
	}
	
}
