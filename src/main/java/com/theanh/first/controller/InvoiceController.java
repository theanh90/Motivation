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
import com.theanh.first.model.inmodel.InvoiceInModel;
import com.theanh.first.service.InvoiceService;

@Controller
@RequestMapping(value = "/api/invoice")
public class InvoiceController extends BaseController {
	@Autowired
	private InvoiceService invoiceService;
	
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
			dataTableJson = invoiceService.getListInvoiceCustomer(sort, order, limit, offset, typeSearch, textSearch);
		}catch (Exception ex) {
			ex.printStackTrace();
			dataTableJson = new DataTableJson(DataTableJson.ERROR, "Fail to load list Product");
		}
		
		return dataTableJson;
	}
	
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
