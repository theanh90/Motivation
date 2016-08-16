package com.theanh.first.model;

import java.io.Serializable;

public class JsonResponse implements Serializable{
	private static final long serialVersionUID = 1L;
	public static final String SUCCESS = "SUCCESS";
	public static final String ERROR = "ERROR";
	
	private String returnStatus;
	private String message;
	private Object data;
	
	public String getReturnStatus() {
		return returnStatus;
	}
	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	public JsonResponse(){
		
	}
	
	public JsonResponse(String status, String message, Object data) {
		this.returnStatus = status;
		this.message = message;
		this.data = data;
	}
	
	@Override
	public String toString() {
		return "JsonResponse [returnStatus=" + returnStatus + ", message=" + message + ", data=" + data + "]";
	}

}
