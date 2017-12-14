package com.swaaad.dto;

public class ActividadPedagogicaDTO {

	int id;
	String start;
	String title;
	public ActividadPedagogicaDTO() {
		super();
	}
	public ActividadPedagogicaDTO(int id, String start, String title) {
		super();
		this.id = id;
		this.start = start;
		this.title = title;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "ActividadPedagogicaDTO [id=" + id + ", start=" + start + ", title=" + title + "]";
	}
	
	
	
	
}
