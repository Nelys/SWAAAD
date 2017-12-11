package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


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

	@Column(name="NUMERO_PERIODOS")
	private int numeroPeriodos;

	//bi-directional many-to-one association to Evaluacion
	@OneToMany(mappedBy="periodo")
	private List<Evaluacion> evaluacions;

	//bi-directional many-to-one association to Curso
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_CURSO")
	private Curso curso;

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

	public int getNumeroPeriodos() {
		return this.numeroPeriodos;
	}

	public void setNumeroPeriodos(int numeroPeriodos) {
		this.numeroPeriodos = numeroPeriodos;
	}

	public List<Evaluacion> getEvaluacions() {
		return this.evaluacions;
	}

	public void setEvaluacions(List<Evaluacion> evaluacions) {
		this.evaluacions = evaluacions;
	}

	public Evaluacion addEvaluacion(Evaluacion evaluacion) {
		getEvaluacions().add(evaluacion);
		evaluacion.setPeriodo(this);

		return evaluacion;
	}

	public Evaluacion removeEvaluacion(Evaluacion evaluacion) {
		getEvaluacions().remove(evaluacion);
		evaluacion.setPeriodo(null);

		return evaluacion;
	}

	public Curso getCurso() {
		return this.curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

}