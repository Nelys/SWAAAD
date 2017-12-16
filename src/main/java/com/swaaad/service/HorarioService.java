package com.swaaad.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.swaaad.model.Horario;

@Service
public interface HorarioService {

	void addHorario(Horario horario) throws Exception;

	Horario getHorarioById(int idHorario) throws Exception;

	void updateHorario(Horario horario) throws Exception;

	void deleteHorario(int idHorario) throws Exception;
	
	List<Horario> getHorarioByDocente(int idUsuario) throws Exception;
	
	Boolean verificarDisponibilidad(int idUsuario,int dia,String inicio,String fin) throws Exception;
}
