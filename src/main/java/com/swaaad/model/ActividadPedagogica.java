package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the actividad_pedagogica database table.
 * 
 */
@Entity
@Table(name="actividad_pedagogica")
@NamedQuery(name="ActividadPedagogica.findAll", query="SELECT a FROM ActividadPedagogica a")
public class ActividadPedagogica implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_ACTIVIDAD")
	private int idActividad;

	private String descripcion;

	@Temporal(TemporalType.TIMESTAMP)
	private Date fecha;

	private byte recordar;

	//bi-directional many-to-one association to CursoAlumno
	@ManyToOne
	@JoinColumn(name="ID_CURSO_ALUMNO")
	private CursoAlumno cursoAlumno;

	public ActividadPedagogica() {
	}

	public int getIdActividad() {
		return this.idActividad;
	}

	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getFecha() {
		return this.fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public byte getRecordar() {
		return this.recordar;
	}

	public void setRecordar(byte recordar) {
		this.recordar = recordar;
	}

	public CursoAlumno getCursoAlumno() {
		return this.cursoAlumno;
	}

	public void setCursoAlumno(CursoAlumno cursoAlumno) {
		this.cursoAlumno = cursoAlumno;
	}

}