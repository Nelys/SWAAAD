package com.swaaad.dto;


public class NotaDTO {

	private int idNota;

	private int idAlumno;

	private int notaEvaluativa;

	
	public NotaDTO(int idNota, int idAlumno, int notaEvaluativa) {
		super();
		this.idNota = idNota;
		this.idAlumno = idAlumno;
		this.notaEvaluativa = notaEvaluativa;
	}

	
	public NotaDTO() {
		super();
	}


	public int getIdNota() {
		return idNota;
	}

	public void setIdNota(int idNota) {
		this.idNota = idNota;
	}

	public int getIdAlumno() {
		return idAlumno;
	}

	public void setIdAlumno(int idAlumno) {
		this.idAlumno = idAlumno;
	}

	public int getNotaEvaluativa() {
		return notaEvaluativa;
	}

	public void setNotaEvaluativa(int notaEvaluativa) {
		this.notaEvaluativa = notaEvaluativa;
	}

	
	
}
