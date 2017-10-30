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

	@Column(name="COLOR_FONDO")
	private String colorFondo;

	@Column(name="COLOR_TEXTO")
	private String colorTexto;

	@Column(name="COORD_X")
	private int coordX;

	@Column(name="COORD_Y")
	private int coordY;

	private byte estado;

	@Column(name="ID_CURSO_ALUMNO")
	private int idCursoAlumno;

	public AulaDinamica() {
	}

	public int getIdAulaDinamica() {
		return this.idAulaDinamica;
	}

	public void setIdAulaDinamica(int idAulaDinamica) {
		this.idAulaDinamica = idAulaDinamica;
	}

	public String getColorFondo() {
		return this.colorFondo;
	}

	public void setColorFondo(String colorFondo) {
		this.colorFondo = colorFondo;
	}

	public String getColorTexto() {
		return this.colorTexto;
	}

	public void setColorTexto(String colorTexto) {
		this.colorTexto = colorTexto;
	}

	public int getCoordX() {
		return this.coordX;
	}

	public void setCoordX(int coordX) {
		this.coordX = coordX;
	}

	public int getCoordY() {
		return this.coordY;
	}

	public void setCoordY(int coordY) {
		this.coordY = coordY;
	}

	public byte getEstado() {
		return this.estado;
	}

	public void setEstado(byte estado) {
		this.estado = estado;
	}

	public int getIdCursoAlumno() {
		return this.idCursoAlumno;
	}

	public void setIdCursoAlumno(int idCursoAlumno) {
		this.idCursoAlumno = idCursoAlumno;
	}

}