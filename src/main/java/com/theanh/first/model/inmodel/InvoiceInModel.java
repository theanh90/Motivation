package com.theanh.first.model.inmodel;

import java.util.List;

public class InvoiceInModel {
	private Integer express_wash;
	private Integer totalPay;
	private String note;
	private Integer customer_id;
	private Integer totalPrice;
	private List<InvoiceDetailsInModel> products;
	
	public Integer getExpress_wash() {
		return express_wash;
	}
	public void setExpress_wash(Integer express_wash) {
		this.express_wash = express_wash;
	}
	public Integer getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(Integer totalPay) {
		this.totalPay = totalPay;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Integer getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	public Integer getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	public List<InvoiceDetailsInModel> getProducts() {
		return products;
	}
	public void setProducts(List<InvoiceDetailsInModel> products) {
		this.products = products;
	}

}
