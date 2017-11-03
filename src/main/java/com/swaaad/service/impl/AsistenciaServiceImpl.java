package com.swaaad.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.AsistenciaDao;
import com.swaaad.dao.CursoAlumnoDao;
import com.swaaad.model.Asistencia;
import com.swaaad.model.CursoAlumno;
import com.swaaad.service.AsistenciaService;

@Service
public class AsistenciaServiceImpl implements AsistenciaService {

	@Autowired
	AsistenciaDao objAsistenciaDao;

	@Autowired
	CursoAlumnoDao objCursoAlumnoDao;

	@Override
	public void addAsistencia(Asistencia asistencia) throws Exception {
		objAsistenciaDao.addAsistencia(asistencia);
	}

	@Override
	public void updateAsistencia(Asistencia asistencia) throws Exception {
		objAsistenciaDao.upddateAsistencia(asistencia);

	}

	@Override
	public List<Asistencia> getAllAlumnosByCursoMes(int idCurso) throws Exception {
		// TODO Auto-generated method stub
		return objAsistenciaDao.getAllAlumnosByCursoMes(idCurso);
	}

	@Override
	public List<Integer> asistenciaMes(int Mes, int idCurso) throws Exception {
		// TODO Auto-generated method stub
		return objAsistenciaDao.asistenciaMes(Mes, idCurso);
	}

	@Override
	public List<Integer> getDayOfAlumnosByCurso(int idCurso, int mes) throws Exception {
		// TODO Auto-generated method stub
		return objAsistenciaDao.getDayOfAlumnosByCurso(idCurso, mes);
	}

	@Override
	public List<Asistencia> getEstadoByAlumnoCurso(int idCurso, int mes) throws Exception {
		// TODO Auto-generated method stub
		return objAsistenciaDao.getEstadoByAlumnoCurso(idCurso, mes);
	}

	@Override
	public void generarAsistencia(Date fecha, int idCurso) throws Exception {

		// recuperar todos los cursoAlumnos

		// verificar si registros
		if (objAsistenciaDao.getByDay(idCurso, fecha).size()==0) {
			System.out.println("no hay registros");	
			List<CursoAlumno> listaAlumnos = objCursoAlumnoDao.getAllAlumnosByCurso(idCurso);

			for (CursoAlumno cursoAlumno : listaAlumnos) {
				Asistencia asistencia = new Asistencia();
				asistencia.setCursoAlumno(cursoAlumno);
				asistencia.setEstado("A");
				asistencia.setFecha(fecha);
				objAsistenciaDao.addAsistencia(asistencia);
			}
		}else
		{
			System.out.println("existen registros");	
		}

	}

	@Override
	public List<Asistencia> getByDay(int idCurso, Date fecha) throws Exception {
		// TODO Auto-generated method stub
		return objAsistenciaDao.getByDay(idCurso, fecha);
	}

	@Override
	public Asistencia getById(int idAsistencia) throws Exception {

		return objAsistenciaDao.getById(idAsistencia);
	}

}
