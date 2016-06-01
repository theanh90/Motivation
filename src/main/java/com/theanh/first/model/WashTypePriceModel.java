package com.theanh.first.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "WASHTYPEPRICE")
public class WashTypePriceModel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "PID")
	private Integer pid; // the id of product
	
	@Column(name = "LAUNDRY")
	private Integer laundry; // Giat nuoc
	
	@Column(name = "DRYCLEAN")
	private Integer dryClean; // Giat hap
	
	@Column(name = "PRESSONLY", nullable = true)
	private Integer pressOnly; // Chi ui
	
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
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
	
	@Override
	public String toString() {
		return "[WashingPrice:: id: " + pid + ", laundry: " + laundry + ", dryclean: " + 
				dryClean + ", pressonly: " + pressOnly;
	}

}
