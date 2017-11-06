package com.swaaad.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaaad.dao.HorarioDao;
import com.swaaad.model.Horario;
import com.swaaad.service.HorarioService;

@Service
public class HorarioServiceImpl implements HorarioService {
	
    @Autowired
    private HorarioDao objHorarioDao;

	@Override
	public void addHorario(Horario horario) throws Exception {
		objHorarioDao.addHorario(horario);

	}

	@Override
	public Horario getHorarioById(int idHorario) throws Exception {
		return objHorarioDao.getHorarioById(idHorario);
	}

	@Override
	public void updateHorario(Horario horario) throws Exception {
		objHorarioDao.updateHorario(horario);

	}

	@Override
	public void deleteHorario(int idHorario) throws Exception {
		objHorarioDao.deleteHorario(idHorario);

	}

}
