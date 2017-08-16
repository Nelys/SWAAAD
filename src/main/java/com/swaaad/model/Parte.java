package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the parte database table.
 * 
 */
@Entity
@NamedQuery(name="Parte.findAll", query="SELECT p FROM Parte p")
public class Parte implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_PARTE")
	private int idParte;

	private String descripcion;

	private String signo;

	public Parte() {
	}

	public int getIdParte() {
		return this.idParte;
	}

	public void setIdParte(int idParte) {
		this.idParte = idParte;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getSigno() {
		return this.signo;
	}

	public void setSigno(String signo) {
		this.signo = signo;
	}

}