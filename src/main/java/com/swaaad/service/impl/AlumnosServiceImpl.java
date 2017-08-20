package com.swaaad.service.impl;

import java.util.List;

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
