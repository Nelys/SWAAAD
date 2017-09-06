package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the aula_dinamica database table.
 * 
 */
@Entity
@Table(name="aula_dinamica")
@NamedQuery(name="AulaDinamica.findAll", query="SELECT a FROM AulaDinamica a")
public class AulaDinamica implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_AULA_DINAMICA")
	private int idAulaDinamica;

	private String color;

	private int columna;

	private int fila;

	//uni-directional many-to-one association to Curso
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_CURSO")
	private Curso curso;

	public AulaDinamica() {
	}

	public int getIdAulaDinamica() {
		return this.idAulaDinamica;
	}

	public void setIdAulaDinamica(int idAulaDinamica) {
		this.idAulaDinamica = idAulaDinamica;
	}

	public String getColor() {
		return this.color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getColumna() {
		return this.columna;
	}

	public void setColumna(int columna) {
		this.columna = columna;
	}

	public int getFila() {
		return this.fila;
	}

	public void setFila(int fila) {
		this.fila = fila;
	}

	public Curso getCurso() {
		return this.curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}

}