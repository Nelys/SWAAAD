package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the formula_detalle database table.
 * 
 */
@Entity
@Table(name="formula_detalle")
@NamedQuery(name="FormulaDetalle.findAll", query="SELECT f FROM FormulaDetalle f")
public class FormulaDetalle implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_FORMULA_DETALLE")
	private int idFormulaDetalle;

	@Column(name="ID_EVALUACION")
	private int idEvaluacion;

	private int item;

	//uni-directional many-to-one association to Formula
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_FORMULA")
	private Formula formula;

	//uni-directional many-to-one association to Parte
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_PARTE")
	private Parte parte;

	public FormulaDetalle() {
	}

	public int getIdFormulaDetalle() {
		return this.idFormulaDetalle;
	}

	public void setIdFormulaDetalle(int idFormulaDetalle) {
		this.idFormulaDetalle = idFormulaDetalle;
	}

	public int getIdEvaluacion() {
		return this.idEvaluacion;
	}

	public void setIdEvaluacion(int idEvaluacion) {
		this.idEvaluacion = idEvaluacion;
	}

	public int getItem() {
		return this.item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public Formula getFormula() {
		return this.formula;
	}

	public void setFormula(Formula formula) {
		this.formula = formula;
	}

	public Parte getParte() {
		return this.parte;
	}

	public void setParte(Parte parte) {
		this.parte = parte;
	}

}