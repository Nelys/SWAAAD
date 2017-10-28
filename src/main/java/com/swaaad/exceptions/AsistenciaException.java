package com.swaaad.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Id No Encontrado")
public class AsistenciaException extends Exception {

	private static final long serialVersionUID = -3332292346834265371L;

	public AsistenciaException(int id) {
		super("AsistenciaException with id=" + id);
	}
}