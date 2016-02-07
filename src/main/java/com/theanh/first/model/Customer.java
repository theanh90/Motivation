package com.theanh.first.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CUSTOMER")
public class Customer {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "ID")
	private Integer cId;
	
	@Column(name = "NAME", nullable = false)
	private String name;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "NOTE")
	private String note;
	
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	public Customer() {}
	
	public Customer(Integer id, String name, String phone, String note) {
		this.cId = id;
		this.name = name;
		this.phone = phone;
		this.note = note;
	}
	
	@Override
	public String toString() {
		return "Customer: {id: + " + cId + ", name: " + name + ", phone: " + name + ", note: " + note + "}";
	}

}
