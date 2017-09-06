package com.swaaad.service;

import org.springframework.stereotype.Service;

import com.swaaad.model.Horario;

@Service
public interface HorarioService {

	void addHorario(Horario horario) throws Exception;

	Horario getHorarioById(int idHorario) throws Exception;

	void updateHorario(Horario horario) throws Exception;

	void deleteHorario(int idHorario) throws Exception;
}
