package com.theanh.first.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "INVOICEDETAILS")
public class InvoiceDetailsModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "PID")	
	private Integer pid; // productId
	
	@Id
	@Column(name = "INID")	
	private Integer inId; // invoiceId
	
	@Column(name = "QUANTITY")	
	private Integer quantity;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
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
