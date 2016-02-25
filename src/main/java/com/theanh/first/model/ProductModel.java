package com.theanh.first.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PRODUCT")
public class ProductModel  implements Serializable{	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "PID")
	private Integer pId;
	
	@Column(name = "ENNAME", nullable = false)
	private String enName;
	
	@Column(name = "VNNAME", nullable = false)
	private String vnName;
	
	@Column(name = "UNIT", nullable = false)
	private String unit;
	
	@Column(name = "NOTE", nullable = true)
	private String note;
	
	public Integer getPId() {
		return pId;
	}
	public void setPId(Integer pId) {
		this.pId = pId;
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
	
	@Override
	public String toString() {
		return "Product: {id: " + pId + ", enName: " + enName + ", vnName: " + vnName + ", unit: "
				+ unit + ", note: " + note + "}";
	}
}
