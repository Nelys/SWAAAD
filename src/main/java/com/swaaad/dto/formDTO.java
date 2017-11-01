package com.swaaad.dto;

public class formDTO {
private String idActividad;
private String descripcion;
private String fecha;
public String getIdActividad() {
	return idActividad;
}
public void setIdActividad(String idActividad) {
	this.idActividad = idActividad;
}
public String getDescripcion() {
	return descripcion;
}
public void setDescripcion(String descripcion) {
	this.descripcion = descripcion;
}
public String getFecha() {
	return fecha;
}
public void setFecha(String fecha) {
	this.fecha = fecha;
}
public formDTO(String idActividad, String descripcion, String fecha) {
	super();
	this.idActividad = idActividad;
	this.descripcion = descripcion;
	this.fecha = fecha;
}
public formDTO() {
	super();
}





}
