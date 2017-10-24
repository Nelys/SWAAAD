package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


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

	//bi-directional many-to-one association to Asistencia
	@OneToMany(mappedBy="cursoAlumno")
	private List<Asistencia> asistencias;

	//bi-directional many-to-one association to Alumno
	@ManyToOne
	@JoinColumn(name="ID_ALUMNO")
	private Alumno alumno;

	//bi-directional many-to-one association to Curso
	@ManyToOne
	@JoinColumn(name="ID_CURSO")
	private Curso curso;

	public CursoAlumno() {
	}

	public int getIdCursoAlumno() {
		return this.idCursoAlumno;
	}

	public void setIdCursoAlumno(int idCursoAlumno) {
		this.idCursoAlumno = idCursoAlumno;
	}

	public List<Asistencia> getAsistencias() {
		return this.asistencias;
	}

	public void setAsistencias(List<Asistencia> asistencias) {
		this.asistencias = asistencias;
	}

	public Asistencia addAsistencia(Asistencia asistencia) {
		getAsistencias().add(asistencia);
		asistencia.setCursoAlumno(this);

		return asistencia;
	}

	public Asistencia removeAsistencia(Asistencia asistencia) {
		getAsistencias().remove(asistencia);
		asistencia.setCursoAlumno(null);

		return asistencia;
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