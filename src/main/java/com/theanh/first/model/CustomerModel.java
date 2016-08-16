package com.theanh.first.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CUSTOMER")
public class CustomerModel implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "CID")
	private Integer cid;
	
	@Column(name = "NAME", nullable = false)
	private String name;
	
	@Column(name = "ADDRESS", nullable = false)
	private String address;

	@Column(name = "PHONE", nullable = false)
	private String phone;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "NOTE")
	private String note;
	
	@Column(name = "ACTIVE", nullable = false)
	private Integer active;
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	public Integer getActive() {
		return active;
	}
	public void setActive(Integer active) {
		this.active = active;
	}
	public CustomerModel() {}
	
	public CustomerModel(Integer id, String name, String address, String phone, String email, String note) {
		this.cid = id;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.note = note;
	}
	
	@Override
	public String toString() {
		return "Customer: {id: " + cid + ", address: " + address + ", name: " + name + ", phone: "
				+ phone + ", email: " + email + ", note: " + note + ", isActive: " + active + "}";
	}

}
