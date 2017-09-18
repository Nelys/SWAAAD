package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the curso_alumno database table.
 * 
 */
@Entity
@Table(name="curso_alumno")
@NamedQuery(name="CursoAlumno.findAll", query="SELECT c FROM CursoAlumno c")
public class CursoAlumno implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_CURSO_ALUMNO")
	private int idCursoAlumno;

	//uni-directional many-to-one association to Alumno
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_ALUMNO")
	private Alumno alumno;

	//uni-directional many-to-one association to Curso
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_CURSO")
	private Curso curso;

	public CursoAlumno() {
	    // Constructor vacio
	}

	public int getIdCursoAlumno() {
		return this.idCursoAlumno;
	}

	public void setIdCursoAlumno(int idCursoAlumno) {
		this.idCursoAlumno = idCursoAlumno;
	}

	public Alumno getAlumno() {
		return this.alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	public Curso getCurso() {
		return this.curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

}