package com.theanh.first.model;

public class WashTypePrice {
	
	private Integer pId;
	private Integer laundry; // Giat nuoc
	private Integer dryClean; // Giat hap
	private Integer pressOnly; // Chi ui
	
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
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
