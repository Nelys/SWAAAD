package com.swaaad.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the alumno database table.
 * 
 */
@Entity
@NamedQuery(name="Alumno.findAll", query="SELECT a FROM Alumno a")
public class Alumno implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="ID_ALUMNO")
	private int idAlumno;

	private String apellidos;

	@Column(name="APELLIDOS_APODERADO")
	private String apellidosApoderado;

	private String email;

	@Column(name="EMAIL_APODERADO")
	private String emailApoderado;

	private String genero;

	private String nombres;

	@Column(name="NOMBRES_APODERADO")
	private String nombresApoderado;

	//bi-directional many-to-one association to CursoAlumno
	@OneToMany(mappedBy="alumno")
	private List<CursoAlumno> cursoAlumnos;

	//bi-directional many-to-one association to Nota
	@OneToMany(mappedBy="alumno")
	private List<Nota> notas;

	public Alumno() {
	}

	public int getIdAlumno() {
		return this.idAlumno;
	}

	public void setIdAlumno(int idAlumno) {
		this.idAlumno = idAlumno;
	}

	public String getApellidos() {
		return this.apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getApellidosApoderado() {
		return this.apellidosApoderado;
	}

	public void setApellidosApoderado(String apellidosApoderado) {
		this.apellidosApoderado = apellidosApoderado;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailApoderado() {
		return this.emailApoderado;
	}

	public void setEmailApoderado(String emailApoderado) {
		this.emailApoderado = emailApoderado;
	}

	public String getGenero() {
		return this.genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public String getNombres() {
		return this.nombres;
	}

	public void setNombres(String nombres) {
		this.nombres = nombres;
	}

	public String getNombresApoderado() {
		return this.nombresApoderado;
	}

	public void setNombresApoderado(String nombresApoderado) {
		this.nombresApoderado = nombresApoderado;
	}

	public List<CursoAlumno> getCursoAlumnos() {
		return this.cursoAlumnos;
	}

	public void setCursoAlumnos(List<CursoAlumno> cursoAlumnos) {
		this.cursoAlumnos = cursoAlumnos;
	}

	public CursoAlumno addCursoAlumno(CursoAlumno cursoAlumno) {
		getCursoAlumnos().add(cursoAlumno);
		cursoAlumno.setAlumno(this);

		return cursoAlumno;
	}

	public CursoAlumno removeCursoAlumno(CursoAlumno cursoAlumno) {
		getCursoAlumnos().remove(cursoAlumno);
		cursoAlumno.setAlumno(null);

		return cursoAlumno;
	}

	public List<Nota> getNotas() {
		return this.notas;
	}

	public void setNotas(List<Nota> notas) {
		this.notas = notas;
	}

	public Nota addNota(Nota nota) {
		getNotas().add(nota);
		nota.setAlumno(this);

		return nota;
	}

	public Nota removeNota(Nota nota) {
		getNotas().remove(nota);
		nota.setAlumno(null);

		return nota;
	}

}