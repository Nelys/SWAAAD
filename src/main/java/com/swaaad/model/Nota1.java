package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the nota database table.
 * 
 */
@Entity
@NamedQuery(name="Nota1.findAll", query="SELECT n FROM Nota n")
public class Nota1 implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_NOTA")
	private int idNota;

	private int nota;

	//uni-directional many-to-one association to Capacidad
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_CAPACIDAD")
	private Capacidad capacidad;

	//uni-directional many-to-one association to CursoAlumno
//	@ManyToOne(fetch=FetchType.LAZY)
//	@JoinColumn(name="ID_CURSO_ALUMNO")
	@Column(name="ID_CURSO_ALUMNO")
	private CursoAlumno cursoAlumno;

	public Nota1() {
	}

	public int getIdNota() {
		return this.idNota;
	}

	public void setIdNota(int idNota) {
		this.idNota = idNota;
	}

	public int getNota() {
		return this.nota;
	}

	public void setNota(int nota) {
		this.nota = nota;
	}

	public Capacidad getCapacidad() {
		return this.capacidad;
	}

	public void setCapacidad(Capacidad capacidad) {
		this.capacidad = capacidad;
	}

	public CursoAlumno getCursoAlumno() {
		return this.cursoAlumno;
	}

	public void setCursoAlumno(CursoAlumno cursoAlumno) {
		this.cursoAlumno = cursoAlumno;
	}

}