package com.theanh.first.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.theanh.first.model.id.InvoiceDetailCustomerViewModelId;

@Entity
@Table(name = "INVOICEDETAILCUSTOMERVIEW")
public class InvoiceDetailCustomerViewModel implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	InvoiceDetailCustomerViewModelId id;
	
	@Column(name = "DATECREATE")
	private Date datecreate;
	
	@Column(name = "TOTALPRICE")
	private Integer totalPrice;
	
	@Column(name = "TOTALPAY")
	private Integer totalPay;
	
	@Column(name = "VAT")
	private Integer vat;
	
	@Column(name = "DISCOUNT")
	private Integer discount;
	
	@Column(name = "ISEXPRESS")
	private Integer isExpress;
	
	@Column(name = "INVOICENOTE")
	private String invoiceNote;
	
	@Column(name = "LASTSTATUS")
	private Integer lastStatus;
	
	@Column(name = "INVOICEACTIVE")
	private Integer invoiceActive;
	
	@Column(name = "PID")
	private Integer pid;

	@Column(name = "UNITPRICE")
	private Integer unitPrice;

	@Column(name = "TYPEPRICE")
	private String typePrice;
	
	@Column(name = "QUANTITY")
	private Integer quantity;	

	@Column(name = "CID")
	private Integer cid;

	@Column(name = "NAME")
	private String name;

	@Column(name = "PHONE")
	private String phone;

	@Column(name = "EMAIL")
	private String email;	

	@Column(name = "ADDRESS")
	private String address;

	@Column(name = "CUSTOMERNOTE")
	private String customerNote;

	@Column(name = "CUSTOMERACTIVE")
	private Integer customerActive;
	
	@Column(name = "ENNAME")
	private String enName;
	
	@Column(name = "VNNAME")
	private String vnName;

	public InvoiceDetailCustomerViewModelId getId() {
		return id;
	}

	public void setId(InvoiceDetailCustomerViewModelId id) {
		this.id = id;
	}

	public Date getDatecreate() {
		return datecreate;
	}

	public void setDatecreate(Date datecreate) {
		this.datecreate = datecreate;
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

	public String getInvoiceNote() {
		return invoiceNote;
	}

	public void setInvoiceNote(String invoiceNote) {
		this.invoiceNote = invoiceNote;
	}

	public Integer getLastStatus() {
		return lastStatus;
	}

	public void setLastStatus(Integer lastStatus) {
		this.lastStatus = lastStatus;
	}

	public Integer getInvoiceActive() {
		return invoiceActive;
	}

	public void setInvoiceActive(Integer invoiceActive) {
		this.invoiceActive = invoiceActive;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getTypePrice() {
		return typePrice;
	}

	public void setTypePrice(String typePrice) {
		this.typePrice = typePrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

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

	public String getCustomerNote() {
		return customerNote;
	}

	public void setCustomerNote(String customerNote) {
		this.customerNote = customerNote;
	}

	public Integer getCustomerActive() {
		return customerActive;
	}

	public void setCustomerActive(Integer customerActive) {
		this.customerActive = customerActive;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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

	@Override
	public String toString() {
		return "InvoiceDetailCustomerViewModel [id=" + id + ", datecreate=" + datecreate + ", totalPrice=" + totalPrice
				+ ", totalPay=" + totalPay + ", vat=" + vat + ", discount=" + discount + ", isExpress=" + isExpress
				+ ", invoiceNote=" + invoiceNote + ", lastStatus=" + lastStatus + ", invoiceActive=" + invoiceActive
				+ ", pid=" + pid + ", unitPrice=" + unitPrice + ", typePrice=" + typePrice + ", quantity=" + quantity
				+ ", cid=" + cid + ", name=" + name + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", customerNote=" + customerNote + ", customerActive=" + customerActive + ", enName=" + enName
				+ ", vnName=" + vnName + "]";
	}

	
}
