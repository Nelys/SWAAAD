package com.swaaad.reports;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.swaaad.model.CursoAlumno;

public class CursoAlumnoReport {

	public List<Map<String, ?>> findAllAlumnos(List<CursoAlumno> listaAlumnosCursos) {


		List<Map<String, ?>> listaAlumnos = new ArrayList<Map<String, ?>>();

		for (CursoAlumno a : listaAlumnosCursos) {
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("id", a.getAlumno().getIdAlumno());
			m.put("nombres", a.getAlumno().getNombres());
			m.put("apellidos", a.getCurso().getNombreCurso());

			listaAlumnos.add(m);
		}

		return listaAlumnos;
	}
}
