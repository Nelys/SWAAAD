package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the formula_1 database table.
 * 
 */
@Entity
@Table(name="formula")
@NamedQuery(name="Formula1.findAll", query="SELECT f FROM Formula1 f")
public class Formula1 implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name="ID_EVALUACION")
	private int idEvaluacion;

	private String sistema;

	public Formula1() {
	}

	public int getIdEvaluacion() {
		return this.idEvaluacion;
	}

	public void setIdEvaluacion(int idEvaluacion) {
		this.idEvaluacion = idEvaluacion;
	}

	public String getSistema() {
		return this.sistema;
	}

	public void setSistema(String sistema) {
		this.sistema = sistema;
	}

}