package com.swaaad.model;
import java.io.Serializable;
import javax.persistence.*;
import java.util.List;
/**
 * The persistent class for the evaluacion database table.
 * 
 */
@Entity
@NamedQuery(name="Evaluacion.findAll", query="SELECT e FROM Evaluacion e")
public class Evaluacion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="ID_EVALUACION")
    private int idEvaluacion;
    @Column(name="COLOR_FONDO")
    private String color;
    @Column(name="COLOR_TEXTO")
    private String colorTexto;
    private String descripcion;
    @Column(name="ES_FORMULA")
    private byte esFormula;
    private String formula;
    @Column(name="ID_EVALUACION_DEPENDENCIA")
    private int idEvaluacionDependencia;
    private String nombre;
    //bi-directional many-to-one association to Curso
    @ManyToOne
    @JoinColumn(name="ID_CURSO")
    private Curso curso;
    //bi-directional many-to-one association to Nota
    @OneToMany(mappedBy="evaluacion")
    private List<Nota> notas;
    public Evaluacion() {
    }
    public int getIdEvaluacion() {
        return this.idEvaluacion;
    }
    public void setIdEvaluacion(int idEvaluacion) {
        this.idEvaluacion = idEvaluacion;
    }
    public String getColor() {
        return this.color;
    }
    public void setColor(String color) {
        this.color = color;
    }
    public String getColorTexto() {
        return this.colorTexto;
    }
    public void setColorTexto(String colorTexto) {
        this.colorTexto = colorTexto;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public byte getEsFormula() {
        return this.esFormula;
    }
    public void setEsFormula(byte esFormula) {
        this.esFormula = esFormula;
    }
    public String getFormula() {
        return this.formula;
    }
    public void setFormula(String formula) {
        this.formula = formula;
    }
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
    public Curso getCurso() {
        return this.curso;
    }
    public void setCurso(Curso curso) {
        this.curso = curso;
    }
    public List<Nota> getNotas() {
        return this.notas;
    }
    public void setNotas(List<Nota> notas) {
        this.notas = notas;
    }
    public Nota addNota(Nota nota) {
        getNotas().add(nota);
        nota.setEvaluacion(this);
        return nota;
    }
    public Nota removeNota(Nota nota) {
        getNotas().remove(nota);
        nota.setEvaluacion(null);
        return nota;
    }
}