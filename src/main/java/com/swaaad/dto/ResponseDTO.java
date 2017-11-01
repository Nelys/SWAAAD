package com.swaaad.dto;

import java.util.Map;

public class ResponseDTO {

	private String message;
	private Boolean response;
	private Map<String, Object> data;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Boolean getResponse() {
		return response;
	}
	public void setResponse(Boolean response) {
		this.response = response;
	}
	public Map<String, Object> getData() {
		return data;
	}
	public void setData(Map<String, Object> data) {
		this.data = data;
	}
	public ResponseDTO(String message, Boolean response, Map<String, Object> data) {
		super();
		this.message = message;
		this.response = response;
		this.data = data;
	}
	public ResponseDTO() {
		super();
	}
	
	
}
