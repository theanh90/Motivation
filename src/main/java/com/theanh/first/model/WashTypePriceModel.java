package com.theanh.first.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "WASHTYPEPRICE")
public class WashTypePriceModel {
	
	@Id
	@Column(name = "PID")
	private Integer pId; // the id of product
	
	@Column(name = "LAUNDRY")
	private Integer laundry; // Giat nuoc
	
	@Column(name = "DRYCLEAN")
	private Integer dryClean; // Giat hap
	
	@Column(name = "PRESSONLY")
	private Integer pressOnly; // Chi ui
	
	public Integer getPId() {
		return pId;
	}
	public void setPId(Integer pId) {
		this.pId = pId;
	}
	public Integer getLaundry() {
		return laundry;
	}
	public void setLaundry(Integer laundry) {
		this.laundry = laundry;
	}
	public Integer getDryClean() {
		return dryClean;
	}
	public void setDryClean(Integer dryClean) {
		this.dryClean = dryClean;
	}
	public Integer getPressOnly() {
		return pressOnly;
	}
	public void setPressOnly(Integer pressOnly) {
		this.pressOnly = pressOnly;
	}

}
