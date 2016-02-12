package com.theanh.first.model;

import java.util.Collection;

public class DataTableJson {
	public final static String SUCCESS = "SUCCESS";
	public final static String ERROR = "ERROR";
	
	private long totalRow = 0;
	private Collection rows;
	private String status;
	private String message;
	
	public long getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(long totalRow) {
		this.totalRow = totalRow;
	}

	public Collection getRows() {
		return rows;
	}

	public void setRows(Collection rows) {
		this.rows = rows;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public DataTableJson() {
	}
	
	public DataTableJson(String status, String mess) {
		this.status = status;
		this.message = mess;
	}
	
	public DataTableJson(long total, Collection rows, String status, String mess) {
		this.totalRow = total;
		this.rows = rows;
		this.status = status;
		this.message = mess;
	}

}
