package com.swaaad.dto;

public class NotasAlumno {
    
    private int idNota;
    
    private int idAlumno;
    
    private int idEvaluacion;
    
    private int notaEvaluativa;
    
    public NotasAlumno() {
        // Constructor vacio
    }

    public NotasAlumno(int idNota, int idAlumno, int idEvaluacion, int notaEvaluativa) {
        super();
        this.idNota = idNota;
        this.idAlumno = idAlumno;
        this.idEvaluacion = idEvaluacion;
        this.notaEvaluativa = notaEvaluativa;
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

    public int getIdEvaluacion() {
        return idEvaluacion;
    }

    public void setIdEvaluacion(int idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }

    public int getNotaEvaluativa() {
        return notaEvaluativa;
    }

    public void setNotaEvaluativa(int notaEvaluativa) {
        this.notaEvaluativa = notaEvaluativa;
    }


}
