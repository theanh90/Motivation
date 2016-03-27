package com.theanh.first.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "INVOICE")
public class InvoiceModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "INID")	
	private Integer inid;
	
	@Column(name = "CID")	
	private Integer cid;
	
	@Column(name = "DATECREATE", nullable = false)
	private Date dateCreate;
	
	@Column(name = "TOTALPRICE", nullable = false)
	private Integer totalPrice;
	
	@Column(name = "ISEXPRESS", nullable = true)
	private Integer isExpress;
	
	@Column(name = "TOTALPAY", nullable = true)
	private Integer totalPay;
	
	@Column(name = "VAT", nullable = true)
	private Integer vat;
	
	@Column(name = "DISCOUNT", nullable = true)
	private Integer discount;
	
	@Column(name = "NOTE", nullable = true)
	private String note;
	
	@Column(name = "LASTSTATUS", nullable = false)
	private Integer lastStatus;
	
	@Column(name = "ACTIVE", nullable = false)
	private Integer active;
	
	public Integer getInid() {
		return inid;
	}
	public void setInid(Integer inid) {
		this.inid = inid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
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
	public Integer getIsExpress() {
		return isExpress;
	}
	public void setIsExpress(Integer isExpress) {
		this.isExpress = isExpress;
	}
	public void setTotalPay(Integer totalPay) {
		this.totalPay = totalPay;
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
	

}
