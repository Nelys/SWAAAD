package com.swaaad.dto;

public class HorarioVistaDTO {

	int id;
	String title;
	String start;
	String end;
	String className;
	public HorarioVistaDTO() {
		super();
	}
	public HorarioVistaDTO(int id, String title, String start, String end, String className) {
		super();
		this.id = id;
		this.title = title;
		this.start = start;
		this.end = end;
		this.className = className;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	
}
