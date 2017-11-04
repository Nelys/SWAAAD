package com.swaaad.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.swaaad.dao.UsuarioDao;
import com.swaaad.model.Alumno;
import com.swaaad.model.Usuario;

public class UsuarioDaoImpl implements UsuarioDao {
	private static final Logger logger = LoggerFactory.getLogger(UsuarioDaoImpl.class);

	/* implementa la interface AlumnoDAO */

	/**
	 * se encarga de crear la session con la base de datos
	 */
	private SessionFactory sessionFactory;

	/**
	 * almacenara la session con la base de datos
	 */
	Session sSession = null;

	/**
	 * Permite la transacciones con la base de datos
	 */
	Transaction tTransaction = null;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Usuario addUsuario(Usuario usuario) throws Exception {
		// TODO Auto-generated method stub
		sSession = this.sessionFactory.openSession();
		tTransaction = sSession.beginTransaction();
		sSession.persist(usuario);
		tTransaction.commit();
		System.out.println(usuario);
		sSession.close();
		return usuario;
	}

	@Override
	public Usuario verificarEmail(String email) throws Exception {
		sSession = sessionFactory.openSession();
		Usuario usuario = null;
		try {
			String queryAlumno = "From Usuario Where username= :email";
			Query query = sSession.createQuery(queryAlumno);
			query.setString("email", email);
			usuario = (Usuario) query.uniqueResult();

		} catch (Exception e) {
			logger.info("UsuarioDaoImpl verificarEmail: ", e);
			
		} finally {
			sSession.flush();
			sSession.close();
		}
		return usuario;
	}

	@Override
	public Usuario getUsuarioById(int id) throws Exception {
		sSession = sessionFactory.openSession();
		Usuario usuario = null;
		try {
			String queryAlumno = "From Usuario Where id_usuario= :idUsuario";
			Query query = sSession.createQuery(queryAlumno);
			query.setInteger("idUsuario", id);
			usuario = (Usuario) query.uniqueResult();

		} catch (Exception e) {
			logger.info("UsuarioDaoImpl getUsuarioById: ", e);
		} finally {
			sSession.flush();
			sSession.close();

		}

		return usuario;
	}

}
