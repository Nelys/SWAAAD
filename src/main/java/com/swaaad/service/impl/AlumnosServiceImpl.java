package com.swaaad.service.impl;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.AlumnosDao;
import com.swaaad.model.Alumno;
import com.swaaad.service.AlumnosService;

@Service
public class AlumnosServiceImpl implements AlumnosService {

	@Autowired
	AlumnosDao objAlumnoDao;

	@Override
	public void addAlumno(Alumno alumno) throws Exception {

		objAlumnoDao.addAlumno(alumno);

	}

	@Override
	public List<Alumno> getAllAlumnos() throws Exception {
		return objAlumnoDao.getAllAlumnos();
	}
	
	@Override
	public List<Alumno> getAllAlumnosByIdCurso(ServletRequest request) throws IOException, ServletException, Exception {
		
		HttpServletRequest request1 = (HttpServletRequest)request;
		HttpSession session = request1.getSession(false);
		
		int iIdCurso = (Integer) session.getAttribute("idCurso");
		
		System.out.println(iIdCurso + " desde servicio de alumnos");

		//return objAlumnoDao.getAllAlumnos();
		return objAlumnoDao.getAllAlumnosByIdCurso(iIdCurso);
	}

	@Override
	public Alumno getAlumnoById(int idAlumno) throws Exception {

		return objAlumnoDao.getAlumnoById(idAlumno);
	}

	@Override
	public void updateAlumno(Alumno alumno) throws Exception {
		objAlumnoDao.updateAlumno(alumno);
	}

	@Override
	public void deleteAlumno(int idAlumno) throws Exception {
		objAlumnoDao.deleteAlumno(idAlumno);

	}

}
