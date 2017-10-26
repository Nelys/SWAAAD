package com.swaaad.reports;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.swaaad.model.Alumno;

public class AlumnoReport {

    public List<Map<String, ?>> findAllAlumnos(List<Alumno> listaAlumnosCursos) {

        List<Map<String, ?>> listaAlumnos = new ArrayList<Map<String, ?>>();

        for (Alumno a : listaAlumnosCursos) {
            Map<String, Object> m = new HashMap<String, Object>();
            m.put("id", a.getIdAlumno());
            m.put("nombres", a.getNombres());
            m.put("apellidos", a.getApellidos());
            
            listaAlumnos.add(m);
        }

        return listaAlumnos;
    }
}
