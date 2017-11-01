package com.swaaad.dto;

public class AulaDinamicaDTO {

    private int idAulaDinamica;
    private int coordX;
    private int coordY;
    private String colorFondo;
    private String colorTexto;
    private String estado;
    public int getIdAulaDinamica() {
        return idAulaDinamica;
    }
    public void setIdAulaDinamica(int idAulaDinamica) {
        this.idAulaDinamica = idAulaDinamica;
    }
    public int getCoordX() {
        return coordX;
    }
    public void setCoordX(int coordX) {
        this.coordX = coordX;
    }
    public int getCoordY() {
        return coordY;
    }
    public void setCoordY(int coordY) {
        this.coordY = coordY;
    }
    public String getColorFondo() {
        return colorFondo;
    }
    public void setColorFondo(String colorFondo) {
        this.colorFondo = colorFondo;
    }
    public String getColorTexto() {
        return colorTexto;
    }
    public void setColorTexto(String colorTexto) {
        this.colorTexto = colorTexto;
    }
    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public AulaDinamicaDTO(int idAulaDinamica, int coordX, int coordY, String colorFondo, String colorTexto,
            String estado) {
        super();
        this.idAulaDinamica = idAulaDinamica;
        this.coordX = coordX;
        this.coordY = coordY;
        this.colorFondo = colorFondo;
        this.colorTexto = colorTexto;
        this.estado = estado;
    }
    public AulaDinamicaDTO() {
        super();
    }
    
}
