package com.swaaad.service.impl;

import java.util.List;

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

	@Override
	public List<Horario> getHorarioByDocente(int idUsuario) throws Exception {
		return objHorarioDao.getHorarios(idUsuario);
	}

	@Override
	public Boolean verificarDisponibilidad(int idUsuario,int dia, String inicio, String fin) throws Exception {
		// TODO Auto-generated method stub
		
		List<Horario> listaHorarios=objHorarioDao.getHorarioByTiempo(idUsuario,dia, inicio, fin);
		if (listaHorarios.size() ==0) {
			return true;
		} else {
			return false;
		}
	
	}

}
