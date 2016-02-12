package com.theanh.first.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CUSTOMER")
public class CustomerModel implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "CID")
	private Integer cId;
	
	@Column(name = "NAME", nullable = false)
	private String name;
	
	@Column(name = "ADDRESS")
	private String address;

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
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	
	public CustomerModel() {}
	
	public CustomerModel(Integer id, String name, String address, String phone, String note) {
		this.cId = id;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.note = note;
	}
	
	@Override
	public String toString() {
		return "Customer: {id: " + cId + ", address: " + address + ", name: " + name + ", phone: "
				+ phone + ", note: " + note + "}";
	}

}
