package com.theanh.first.model;

public class InvoiceDetails {
	private Integer pId; // productId
	private Integer inId; // invoiceId
	private Integer quantity;
	
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public Integer getInId() {
		return inId;
	}
	public void setInId(Integer inId) {
		this.inId = inId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
