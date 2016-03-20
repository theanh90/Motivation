package com.theanh.first.model.inmodel;

public class InvoiceDetailsInModel {
	private Integer pid;
	private String price_type;
	private Integer qtt;
	private Integer unit_price;
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPrice_type() {
		return price_type;
	}
	public void setPrice_type(String price_type) {
		this.price_type = price_type;
	}
	public Integer getQtt() {
		return qtt;
	}
	public void setQtt(Integer qtt) {
		this.qtt = qtt;
	}
	public Integer getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(Integer unit_price) {
		this.unit_price = unit_price;
	}

}
