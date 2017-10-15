package com.swaaad.dto;



import com.swaaad.model.Curso;

public class EvaluacionDTO {

	private int idEvaluacion;


	private String color;

	
	private String colorTexto;

	private String descripcion;


	private byte esFormula;

	private String formula;


	private int idEvaluacionDependencia;

	private String nombre;


	private Curso curso;

	public EvaluacionDTO(int idEvaluacion, String nombre, String descripcion, String color) {
        super();
        this.idEvaluacion = idEvaluacion;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.color = color;
        
    }
	public EvaluacionDTO(int idEvaluacion, String colorFondo, String colorTexto, String descripcion, byte esFormula,
			String formula, int idEvaluacionDependencia, String nombre, Curso curso) {
		super();
		this.idEvaluacion = idEvaluacion;
		this.color = colorFondo;
		this.colorTexto = colorTexto;
		this.descripcion = descripcion;
		this.esFormula = esFormula;
		this.formula = formula;
		this.idEvaluacionDependencia = idEvaluacionDependencia;
		this.nombre = nombre;
		this.curso = curso;
	}
	


	public EvaluacionDTO() {
		super();
	}



	public int getIdEvaluacion() {
		return idEvaluacion;
	}


	public void setIdEvaluacion(int idEvaluacion) {
		this.idEvaluacion = idEvaluacion;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String colorFondo) {
		this.color = colorFondo;
	}


	public String getColorTexto() {
		return colorTexto;
	}


	public void setColorTexto(String colorTexto) {
		this.colorTexto = colorTexto;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public byte getEsFormula() {
		return esFormula;
	}


	public void setEsFormula(byte esFormula) {
		this.esFormula = esFormula;
	}


	public String getFormula() {
		return formula;
	}


	public void setFormula(String formula) {
		this.formula = formula;
	}


	public int getIdEvaluacionDependencia() {
		return idEvaluacionDependencia;
	}


	public void setIdEvaluacionDependencia(int idEvaluacionDependencia) {
		this.idEvaluacionDependencia = idEvaluacionDependencia;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public Curso getCurso() {
		return curso;
	}


	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
	
}
