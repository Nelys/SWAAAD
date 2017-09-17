package com.swaaad.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.*;

import com.swaaad.model.CursoAlumno;

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

	private String contrasena;

	private String email;

	@Column(name="EMAIL_APODERADO")
	private String emailApoderado;

	private String genero;

	private String imagen;

	private String nombres;

	@Column(name="NOMBRES_APODERADO")
	private String nombresApoderado;

	@Column(name="NRO_ORDEN")
	private int nroOrden;

	public Alumno() {
	}
	
	//private Set<CursoAlumno> alumnoCursos;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
	@JoinTable(name = "curso_alumno",
				joinColumns = { @JoinColumn(name = "ID_ALUMNO") },
				inverseJoinColumns = { @JoinColumn(name = "ID_CURSO") }
			)
	private Set<Curso> cursos;
	//private List<Curso> cursos = new ArrayList<Curso>();

	public Alumno(int idAlumno, String apellidos, String apellidosApoderado, String contrasena, String email,
			String emailApoderado, String genero, String nombres, String nombresApoderado, int nroOrden) {
		super();
		this.idAlumno = idAlumno;
		this.apellidos = apellidos;
		this.apellidosApoderado = apellidosApoderado;
		this.contrasena = contrasena;
		this.email = email;
		this.emailApoderado = emailApoderado;
		this.genero = genero;
		this.nombres = nombres;
		this.nombresApoderado = nombresApoderado;
		this.nroOrden = nroOrden;
	}

	@Override
	public String toString() {
		return "Alumno [idAlumno=" + idAlumno + ", apellidos=" + apellidos + ", apellidosApoderado="
				+ apellidosApoderado + ", contrasena=" + contrasena + ", email=" + email + ", emailApoderado="
				+ emailApoderado + ", genero=" + genero + ", nombres=" + nombres + ", nombresApoderado="
				+ nombresApoderado + ", nroOrden=" + nroOrden + "]";
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

	public String getContrasena() {
		return this.contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
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

	public String getImagen() {
		return this.imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
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

	public int getNroOrden() {
		return this.nroOrden;
	}

	public void setNroOrden(int nroOrden) {
		this.nroOrden = nroOrden;
	}

}