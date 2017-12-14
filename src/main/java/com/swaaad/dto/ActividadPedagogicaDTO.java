package com.swaaad.dto;

public class ActividadPedagogicaDTO {

	int id;
	String fecha;
	String descripcion;
	public ActividadPedagogicaDTO() {
		super();
	}
	public ActividadPedagogicaDTO(int id, String fecha, String descripcion) {
		super();
		this.id = id;
		this.fecha = fecha;
		this.descripcion = descripcion;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	@Override
	public String toString() {
		return "ActividadPedagogicaDTO [id=" + id + ", fecha=" + fecha + ", descripcion=" + descripcion + "]";
	}
	
	
	
}
