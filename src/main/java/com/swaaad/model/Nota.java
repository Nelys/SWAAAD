package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the nota database table.
 * 
 */
@Entity
@NamedQuery(name="Nota.findAll", query="SELECT n FROM Nota n")
public class Nota implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_NOTA")
	private int idNota;

	@Column(name="NOTA_EVALUATIVA")
	private int notaEvaluativa;

	//bi-directional many-to-one association to Alumno
	@ManyToOne
	@JoinColumn(name="ID_ALUMNO")
	private Alumno alumno;

	//bi-directional many-to-one association to Evaluacion
	@ManyToOne
	@JoinColumn(name="ID_EVALUACION")
	private Evaluacion evaluacion;

	public Nota() {
	}

	public int getIdNota() {
		return this.idNota;
	}

	public void setIdNota(int idNota) {
		this.idNota = idNota;
	}

	public int getNotaEvaluativa() {
		return this.notaEvaluativa;
	}

	public void setNotaEvaluativa(int notaEvaluativa) {
		this.notaEvaluativa = notaEvaluativa;
	}

	public Alumno getAlumno() {
		return this.alumno;
	}

	public void setAlumno(Alumno alumno) {
		this.alumno = alumno;
	}

	public Evaluacion getEvaluacion() {
		return this.evaluacion;
	}

	public void setEvaluacion(Evaluacion evaluacion) {
		this.evaluacion = evaluacion;
	}

}