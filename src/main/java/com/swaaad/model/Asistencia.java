package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the asistencia database table.
 * 
 */
@Entity
@NamedQuery(name="Asistencia.findAll", query="SELECT a FROM Asistencia a")
public class Asistencia implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_ASISTENCIA")
	private int idAsistencia;

	private String estado;

	//uni-directional many-to-one association to CursoAlumno
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_CURSO_ALUMNO")
	private CursoAlumno cursoAlumno;

	public Asistencia() {
	}

	public int getIdAsistencia() {
		return this.idAsistencia;
	}

	public void setIdAsistencia(int idAsistencia) {
		this.idAsistencia = idAsistencia;
	}

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public CursoAlumno getCursoAlumno() {
		return this.cursoAlumno;
	}

	public void setCursoAlumno(CursoAlumno cursoAlumno) {
		this.cursoAlumno = cursoAlumno;
	}

}