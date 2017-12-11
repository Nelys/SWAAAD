package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the curso database table.
 * 
 */
@Entity
@NamedQuery(name="Curso.findAll", query="SELECT c FROM Curso c")
public class Curso implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_CURSO")
	private int idCurso;

	private int anio;

	private int grado;

	private String institucion;

	@Column(name="NOMBRE_CURSO")
	private String nombreCurso;

	private String seccion;

	//bi-directional many-to-one association to ActividadPedagogica
	@OneToMany(mappedBy="curso")
	private List<ActividadPedagogica> actividadPedagogicas;

	//bi-directional many-to-one association to Docente
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ID_DOCENTE")
	private Docente docente;

	//bi-directional many-to-one association to CursoAlumno
	@OneToMany(mappedBy="curso")
	private List<CursoAlumno> cursoAlumnos;

	//bi-directional many-to-one association to Horario
	@OneToMany(mappedBy="curso")
	private List<Horario> horarios;

	//bi-directional many-to-one association to Periodo
	@OneToMany(mappedBy="curso")
	private List<Periodo> periodos;

	public Curso() {
	}

	public int getIdCurso() {
		return this.idCurso;
	}

	public void setIdCurso(int idCurso) {
		this.idCurso = idCurso;
	}

	public int getAnio() {
		return this.anio;
	}

	public void setAnio(int anio) {
		this.anio = anio;
	}

	public int getGrado() {
		return this.grado;
	}

	public void setGrado(int grado) {
		this.grado = grado;
	}

	public String getInstitucion() {
		return this.institucion;
	}

	public void setInstitucion(String institucion) {
		this.institucion = institucion;
	}

	public String getNombreCurso() {
		return this.nombreCurso;
	}

	public void setNombreCurso(String nombreCurso) {
		this.nombreCurso = nombreCurso;
	}

	public String getSeccion() {
		return this.seccion;
	}

	public void setSeccion(String seccion) {
		this.seccion = seccion;
	}

	public List<ActividadPedagogica> getActividadPedagogicas() {
		return this.actividadPedagogicas;
	}

	public void setActividadPedagogicas(List<ActividadPedagogica> actividadPedagogicas) {
		this.actividadPedagogicas = actividadPedagogicas;
	}

	public ActividadPedagogica addActividadPedagogica(ActividadPedagogica actividadPedagogica) {
		getActividadPedagogicas().add(actividadPedagogica);
		actividadPedagogica.setCurso(this);

		return actividadPedagogica;
	}

	public ActividadPedagogica removeActividadPedagogica(ActividadPedagogica actividadPedagogica) {
		getActividadPedagogicas().remove(actividadPedagogica);
		actividadPedagogica.setCurso(null);

		return actividadPedagogica;
	}

	public Docente getDocente() {
		return this.docente;
	}

	public void setDocente(Docente docente) {
		this.docente = docente;
	}

	public List<CursoAlumno> getCursoAlumnos() {
		return this.cursoAlumnos;
	}

	public void setCursoAlumnos(List<CursoAlumno> cursoAlumnos) {
		this.cursoAlumnos = cursoAlumnos;
	}

	public CursoAlumno addCursoAlumno(CursoAlumno cursoAlumno) {
		getCursoAlumnos().add(cursoAlumno);
		cursoAlumno.setCurso(this);

		return cursoAlumno;
	}

	public CursoAlumno removeCursoAlumno(CursoAlumno cursoAlumno) {
		getCursoAlumnos().remove(cursoAlumno);
		cursoAlumno.setCurso(null);

		return cursoAlumno;
	}

	public List<Horario> getHorarios() {
		return this.horarios;
	}

	public void setHorarios(List<Horario> horarios) {
		this.horarios = horarios;
	}

	public Horario addHorario(Horario horario) {
		getHorarios().add(horario);
		horario.setCurso(this);

		return horario;
	}

	public Horario removeHorario(Horario horario) {
		getHorarios().remove(horario);
		horario.setCurso(null);

		return horario;
	}

	public List<Periodo> getPeriodos() {
		return this.periodos;
	}

	public void setPeriodos(List<Periodo> periodos) {
		this.periodos = periodos;
	}

	public Periodo addPeriodo(Periodo periodo) {
		getPeriodos().add(periodo);
		periodo.setCurso(this);

		return periodo;
	}

	public Periodo removePeriodo(Periodo periodo) {
		getPeriodos().remove(periodo);
		periodo.setCurso(null);

		return periodo;
	}

}