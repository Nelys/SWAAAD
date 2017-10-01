package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the evaluacion_1 database table.
 * 
 */
@Entity
@Table(name="evaluacion_1")
@NamedQuery(name="Evaluacion.findAll", query="SELECT e FROM Evaluacion e")
public class Evaluacion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_EVALUACION")
	private int idEvaluacion;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="ID_CURSO")
    private Curso curso;

    @Column(name="ID_EVALUACION_DEPENDENCIA")
    private int idEvaluacionDependencia;

    private String nombre;
	
    private String descripcion;
    
    @Column(name="COLOR_FONDO")
	private String color;
	
	@Column(name="COLOR_TEXTO")
    private String colorTexto;

	/*@Column(name="ID_CURSO")
	private int idCurso;*/
	
	public Evaluacion() {
	    // Constructor vacio
	}

	public Evaluacion(int idEvaluacion, String nombre, String descripcion, String color) {
        super();
        this.idEvaluacion = idEvaluacion;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.color = color;
        
    }

    public int getIdEvaluacion() {
		return this.idEvaluacion;
	}

	public void setIdEvaluacion(int idEvaluacion) {
		this.idEvaluacion = idEvaluacion;
	}

	public String getColorTexto() {
		return this.colorTexto;
	}

	public void setColorTexto(String colorTexto) {
		this.colorTexto = colorTexto;
	}
	
	public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Curso getCurso() {
        return this.curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
	/*public int getIdCurso() {
		return this.idCurso;
	}

	public void setIdCurso(int idCurso) {
		this.idCurso = idCurso;
	}*/

	public int getIdEvaluacionDependencia() {
		return this.idEvaluacionDependencia;
	}

	public void setIdEvaluacionDependencia(int idEvaluacionDependencia) {
		this.idEvaluacionDependencia = idEvaluacionDependencia;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}