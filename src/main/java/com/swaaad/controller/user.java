package com.swaaad.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class user {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BCryptPasswordEncoder pe = new BCryptPasswordEncoder();
		System.out.println(pe.encode("admin"));
	}

}
