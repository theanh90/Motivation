package com.theanh.first.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "INVOICECUSTOMERVIEW")
public class InvoiceCustomerViewModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "INID")
	private Integer inId;
	
	@Column(name = "CID")
	private Integer cId;
	
	@Column(name = "DATECREATE")
	private Date dateCreate;
	
	@Column(name = "TOTALPRICE")
	private Integer totalPrice;
	
	@Column(name = "TOTALPAY")
	private Integer totalPay;
	
	@Column(name = "DUEAMOUNT")
	private Integer dueAmount;
	
	@Column(name = "VAT")
	private Integer vat;
	
	@Column(name = "DISCOUNT")
	private Integer discount;
	
	@Column(name = "ISEXPRESS")
	private Integer isExpress;
	
	@Column(name = "NOTE")
	private String note;
	
	@Column(name = "LASTSTATUS")
	private Integer lastStatus;
	
	@Column(name = "ACTIVE")
	private Integer active;
	
	@Column(name = "NAME")
	private String name;
	
	@Column(name = "PHONE")
	private String phone;
	
	@Column(name = "EMAIL")
	private String email;
	
	@Column(name = "ADDRESS")
	private String address;

	public Integer getInId() {
		return inId;
	}

	public void setInId(Integer inId) {
		this.inId = inId;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public Date getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public Integer getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(Integer totalPay) {
		this.totalPay = totalPay;
	}

	public Integer getDueAmount() {
		return dueAmount;
	}

	public void setDueAmount(Integer dueAmount) {
		this.dueAmount = dueAmount;
	}

	public Integer getVat() {
		return vat;
	}

	public void setVat(Integer vat) {
		this.vat = vat;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Integer getIsExpress() {
		return isExpress;
	}

	public void setIsExpress(Integer isExpress) {
		this.isExpress = isExpress;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getLastStatus() {
		return lastStatus;
	}
	
	public void setLastStatus(Integer lastStatus) {
		this.lastStatus = lastStatus;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "InvoiceCustomerViewModel [inId=" + inId + ", cId=" + cId + ", dateCreate=" + dateCreate
				+ ", totalPrice=" + totalPrice + ", totalPay=" + totalPay + ", dueAmount=" + dueAmount + ", vat=" + vat
				+ ", discount=" + discount + ", isExpress=" + isExpress + ", note=" + note + ", lastStatus="
				+ lastStatus + ", active=" + active + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", address=" + address + "]";
	}
	
	
}
