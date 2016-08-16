package com.theanh.first.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "STUFFCONFIG")
public class StuffConfigModel {
	
	@Id
	@Column(name = "ID")
	private Integer sid;

	@Column(name = "EXPRICEPERCENT", nullable = false)
	private String ExPricePercent;

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getExPricePercent() {
		return ExPricePercent;
	}

	public void setExPricePercent(String exPricePercent) {
		ExPricePercent = exPricePercent;
	}

}
