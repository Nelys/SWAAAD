package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the periodo database table.
 * 
 */
@Entity
@NamedQuery(name="Periodo.findAll", query="SELECT p FROM Periodo p")
public class Periodo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_PERIODO")
	private int idPeriodo;

	private String descripcion;

	//uni-directional many-to-one association to CursoAlumno
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_CURSO_ALUMNO")
	private CursoAlumno cursoAlumno;

	public Periodo() {
	}

	public int getIdPeriodo() {
		return this.idPeriodo;
	}

	public void setIdPeriodo(int idPeriodo) {
		this.idPeriodo = idPeriodo;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public CursoAlumno getCursoAlumno() {
		return this.cursoAlumno;
	}

	public void setCursoAlumno(CursoAlumno cursoAlumno) {
		this.cursoAlumno = cursoAlumno;
	}

}