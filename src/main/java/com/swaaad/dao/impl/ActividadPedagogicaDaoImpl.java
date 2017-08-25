package com.swaaad.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.swaaad.dao.ActividadPedagogicaDao;
import com.swaaad.model.ActividadPedagogica;

public class ActividadPedagogicaDaoImpl implements ActividadPedagogicaDao {
	private SessionFactory sessionFactory;
	Session sSesion = null;
	Transaction tTransaction = null;

	@Override
	public void addActividad(ActividadPedagogica pedagogica) throws Exception {
		sSesion = sessionFactory.openSession();
		tTransaction = sSesion.beginTransaction();
		sSesion.persist(pedagogica);
		tTransaction.commit();
		sSesion.close();
	}

	@Override
	public ActividadPedagogica getActividadById(int idActividad) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateActividad(ActividadPedagogica actividad) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteActividad(int idActividad) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ActividadPedagogica> getAllActividad() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
