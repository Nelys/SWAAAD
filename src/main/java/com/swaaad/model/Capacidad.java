package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the capacidad database table.
 * 
 */
@Entity
@NamedQuery(name="Capacidad.findAll", query="SELECT c FROM Capacidad c")
public class Capacidad implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_CAPACIDAD")
	private int idCapacidad;

	private String descripcion;

	//uni-directional many-to-one association to Competencia
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_COMPETENCIA")
	private Competencia competencia;

	public Capacidad() {
	}

	public int getIdCapacidad() {
		return this.idCapacidad;
	}

	public void setIdCapacidad(int idCapacidad) {
		this.idCapacidad = idCapacidad;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Competencia getCompetencia() {
		return this.competencia;
	}

	public void setCompetencia(Competencia competencia) {
		this.competencia = competencia;
	}

}