package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the pregunta database table.
 * 
 */
@Entity
@NamedQuery(name="Pregunta.findAll", query="SELECT p FROM Pregunta p")
public class Pregunta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_PREGUNTA")
	private int idPregunta;

	private String pregunta;

	private String tema;

	//uni-directional many-to-one association to CursoAlumno
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_CURSO_ALUMNO")
	private CursoAlumno cursoAlumno;

	public Pregunta() {
	}

	public int getIdPregunta() {
		return this.idPregunta;
	}

	public void setIdPregunta(int idPregunta) {
		this.idPregunta = idPregunta;
	}

	public String getPregunta() {
		return this.pregunta;
	}

	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}

	public String getTema() {
		return this.tema;
	}

	public void setTema(String tema) {
		this.tema = tema;
	}

	public CursoAlumno getCursoAlumno() {
		return this.cursoAlumno;
	}

	public void setCursoAlumno(CursoAlumno cursoAlumno) {
		this.cursoAlumno = cursoAlumno;
	}

}