package com.theanh.first.controller;

import java.util.List;
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
import com.theanh.first.model.InvoiceDetailCustomerViewModel;
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
			@RequestParam String typeSearch, @RequestParam String textSearch, @RequestParam(value = "from", required = false) Long from,
			@RequestParam(value = "to", required = false) Long to, @RequestParam(value = "statusType", required = false) Integer statusType) {		
		DataTableJson dataTableJson;
		
		if (!this.hasLogin())
			return null;
		
		try {
			dataTableJson = invoiceService.getListInvoiceCustomer(sort, order, limit, offset, typeSearch, textSearch, statusType, from, to);
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
			Integer invoiceId = invoiceService.save(data.get("invoice"));
			jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Save Invoice successfully!", invoiceId);
			logger.info("Save Invoice successfully");
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to save Invoice!", null);
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getviewbyid", method = RequestMethod.GET, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse getInvoiceViewById(HttpServletRequest request, @RequestParam Integer id) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			List<InvoiceDetailCustomerViewModel> results = invoiceService.getViewById(id);
			
			if (results.size() <= 0) {
				jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to get Invoice!", null);
				logger.info("Fail to get Invoice");
			} else {
				jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Get Invoice successfully!", null);
				jsonResponse.setData(results);		
				logger.info("Get Invoice successfully");
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to get Invoice!", null);
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(value = "/status", method = RequestMethod.PUT, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse changeInvoiceStatus(HttpServletRequest request, @RequestBody Map<String, Integer> data) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			Integer newStatus = null;
			newStatus = invoiceService.changeInvoiceStatus(data.get("invoiceId"));
			
			if (newStatus != null) {
				jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Change Invoice status successfully!", newStatus);
				logger.info("Change Invoice status successfully!");				
			} else {
				jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to Change Invoice status!", null);
				logger.info("Fail to change Invoice status!");		
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to Change Invoice status!", null);
			logger.info("Fail to change Invoice status!");		
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.DELETE, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse deleteInvoice(HttpServletRequest request, @RequestParam Integer invoiceId) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			Boolean result;
			result = invoiceService.deleteInvoice(invoiceId);
			
			if (result == true) {
				jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Delete Invoice successfully!", null);
				logger.info("Change Invoice status successfully!");				
			} else {
				jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to delete Invoice!", null);
				logger.info("Fail to delete Invoice!");		
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to delete Invoice!", null);
			logger.info("Fail to delete Invoice!");		
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(value = "/torequest", method = RequestMethod.PUT, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse setInvoiceStatusToRquest(HttpServletRequest request, @RequestParam Integer invoiceId) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			Boolean result;
			result = invoiceService.setInvoiceStatusToRquest(invoiceId);
			
			if (result == true) {
				jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Send request cancel successfully!", null);
				logger.info("Change Invoice status successfully!");				
			} else {
				jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to send request cancel!", null);
				logger.info("Fail to send request cancel!");		
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to send request cancel!", null);
			logger.info("Fail to send request cancel!");		
		}
		
		return jsonResponse;
	}
	
	@ResponseBody
	@RequestMapping(value = "/pay", method = RequestMethod.PUT, headers = {
			"Accept=*/*" }, produces = "application/json;charset=UTF-8")
	public JsonResponse doPay(HttpServletRequest request, @RequestBody Map<String, Integer> data) {
		JsonResponse jsonResponse;
		if (!this.hasLogin())
			return null;
		
		try {
			Boolean result;
			result = invoiceService.doPay(data);
			
			if (result == true) {
				jsonResponse = new JsonResponse(JsonResponse.SUCCESS, "Success to pay invoice!", null);
				logger.info("Success to pay invoice!");				
			} else {
				jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to pay invoice!", null);
				logger.info("Fail to pay invoice!");		
			}
			
		}catch (Exception ex) {
			ex.printStackTrace();
			jsonResponse = new JsonResponse(JsonResponse.ERROR, "Fail to pay invoice!", null);
			logger.info("Fail to pay invoice!");		
		}
		
		return jsonResponse;
	}
	
}
