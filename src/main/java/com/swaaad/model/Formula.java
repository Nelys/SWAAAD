package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the formula database table.
 * 
 */
@Entity
@NamedQuery(name="Formula.findAll", query="SELECT f FROM Formula f")
public class Formula implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_EVALUACION")
	private int idEvaluacion;

	private String sistema;

	public Formula() {
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