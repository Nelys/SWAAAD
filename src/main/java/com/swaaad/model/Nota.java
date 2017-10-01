package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the nota_1 database table.
 * 
 */
@Entity
@Table(name="nota_1")
@NamedQuery(name="Nota.findAll", query="SELECT n FROM Nota n")
public class Nota implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_NOTA")
	private int idNota;

	

    @Column(name="ID_ALUMNO")
	private int idAlumno;

	@Column(name="NOTA_EVALUATIVA")
	private int notaEvaluativa;
	
	//private int idEvaluacion;

	//uni-directional many-to-one association to Evaluacion1
	@ManyToOne
	@JoinColumn(name="ID_EVALUACION")
	private Evaluacion evaluacion;

	public Nota() {
	    // Constructor vacio
	}
	
	public Nota(int idNota, int idAlumno, int notaEvaluativa) {
        super();
        this.idNota = idNota;
        this.idAlumno = idAlumno;
        //this.set
        this.notaEvaluativa = notaEvaluativa;
        
//        this.evaluacion = evaluacion;
    }
	
	public int getIdNota() {
		return this.idNota;
	}

	public void setIdNota(int idNota) {
		this.idNota = idNota;
	}

	public int getIdAlumno() {
		return this.idAlumno;
	}

	public void setIdAlumno(int idAlumno) {
		this.idAlumno = idAlumno;
	}

	public int getNotaEvaluativa() {
		return this.notaEvaluativa;
	}

	public void setNotaEvaluativa(int notaEvaluativa) {
		this.notaEvaluativa = notaEvaluativa;
	}

	public Evaluacion getEvaluacion() {
		return this.evaluacion;
	}

	public void setEvaluacion(Evaluacion evaluacion) {
		this.evaluacion = evaluacion;
	}
	
	public int getIdEvaluacion1() {
        return this.evaluacion.getIdEvaluacion();
    }

    public void setIdEvaluacion1(Evaluacion evaluacion) {
        this.evaluacion.setIdEvaluacion(evaluacion.getIdEvaluacion());
        //1this.idEvaluacion = evaluacion.setIdEvaluacion(idEvaluacion);
    }
	/*
	public int getIdEvaluacion() {
        return this.idEvaluacion;
    }

    public void setIdEvaluacion(int idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }*/

}