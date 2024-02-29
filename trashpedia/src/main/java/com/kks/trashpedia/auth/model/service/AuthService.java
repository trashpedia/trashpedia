package com.kks.trashpedia.auth.model.service;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.kks.trashpedia.auth.model.dto.User;

public interface AuthService extends UserDetailsService{

	User authenticateByEmail(String userEmail, String userPwd , PasswordEncoder passwordEncoder);


}
