package com.theanh.first.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "INVOICEHISTORY")
public class InvoiceHistoryModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "HID")
	private Integer hid;
	
	@Column(name = "INID")
	private Integer inid;

	@Column(name = "STATUS")
	private Integer status;
	
	@Column(name = "DATECREATE")
	private Date dateCreate;
	
	@Column(name = "CHANGETEXT")
	private String changeText;
	
	@Column(name = "NOTE")
	private String note;

	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public Integer getInid() {
		return inid;
	}

	public void setInid(Integer inid) {
		this.inid = inid;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}

	public String getChangeText() {
		return changeText;
	}

	public void setChangeText(String changeText) {
		this.changeText = changeText;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
}
