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

	//bi-directional many-to-one association to Curso
	@ManyToOne
	@JoinColumn(name="ID_CURSO")
	private Curso curso;

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

	public Curso getCurso() {
		return this.curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

}