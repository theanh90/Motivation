package com.theanh.first.model.id;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class InvoiceDetailCustomerViewModelId implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer inId;	
	private Integer did;
	
	public Integer getInId() {
		return inId;
	}
	public void setInId(Integer inId) {
		this.inId = inId;
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}

}
