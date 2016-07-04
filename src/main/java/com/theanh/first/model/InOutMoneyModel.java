package com.theanh.first.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "INOUTMONEY")
public class InOutMoneyModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "MID")
	private Integer mid;
	
	@Column(name = "TYPE", nullable = false)
	private Integer type;
	
	@Column(name = "DATECREATE", nullable = false)
	private Date dateCreate;
	
	@Column(name = "WHO", nullable = false)
	private String who;
	
	@Column(name = "MONEY", nullable = false)
	private Integer money;
	
	@Column(name = "REASON", nullable = false)
	private String reason;
	
	@Column(name = "DATECANCEL", nullable = true)
	private Date dateCancel;
	
	@Column(name = "WHOCANCEL", nullable = true)
	private String whoCancel;
	
	@Column(name = "ACTIVE", nullable = false)
	private Integer active;

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Date getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}

	public String getWho() {
		return who;
	}

	public void setWho(String who) {
		this.who = who;
	}

	public Integer getMoney() {
		return money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getDateCancel() {
		return dateCancel;
	}

	public void setDateCancel(Date dateCancel) {
		this.dateCancel = dateCancel;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getWhoCancel() {
		return whoCancel;
	}

	public void setWhoCancel(String whoCancel) {
		this.whoCancel = whoCancel;
	}

	public Integer getActive() {
		return active;
	}

	public void setActive(Integer active) {
		this.active = active;
	}
	
}
