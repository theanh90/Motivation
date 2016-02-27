package com.theanh.first.model;

import java.io.Serializable;

public class ProductOutModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer pid;
	private String enName;
	private String vnName;
	private String unit;
	private String note;
	private Integer laundry;
	private Integer dryclean;
	private Integer pressonly;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}

	public String getVnName() {
		return vnName;
	}

	public void setVnName(String vnName) {
		this.vnName = vnName;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getLaundry() {
		return laundry;
	}

	public void setLaundry(Integer laundry) {
		this.laundry = laundry;
	}

	public Integer getDryclean() {
		return dryclean;
	}

	public void setDryclean(Integer dryclean) {
		this.dryclean = dryclean;
	}

	public Integer getPressonly() {
		return pressonly;
	}

	public void setPressonly(Integer pressonly) {
		this.pressonly = pressonly;
	}
	
	@Override
	public String toString() {
		return "ProductOut: {id: " + pid + ", enName: " + enName + ", vnName: " + vnName + ", unit: "
				+ unit + ", note: " + note + ", laundry: "  + laundry + ", dryclean: "
				+ dryclean + ", pressonly: " + pressonly + "}";
	}

}
