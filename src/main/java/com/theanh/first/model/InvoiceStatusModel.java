package com.theanh.first.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "INVOICESTATUS")
public class InvoiceStatusModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "SID")
	private Integer sid;

	@Column(name = "NAME", nullable = false)
	private String name;
	
	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
