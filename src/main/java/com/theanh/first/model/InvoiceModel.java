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
	
	@Column(name = "DATECREATE", nullable = false)
	private Date dateCreate;
	
	@Column(name = "TOTALPRICE", nullable = false)
	private Integer totalPrice;
	
	@Column(name = "TOTALPAY", nullable = true)
	private Integer totalPay;
	
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
