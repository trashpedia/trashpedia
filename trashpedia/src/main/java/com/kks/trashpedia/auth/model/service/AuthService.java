package com.kks.trashpedia.auth.model.service;

import java.io.UnsupportedEncodingException;

import org.springframework.security.core.userdetails.UserDetailsService;

import jakarta.mail.MessagingException;

public interface AuthService extends UserDetailsService{

	String sendEmail(String userEmail) throws MessagingException, UnsupportedEncodingException;

	int temporaryPwd(String userEmail, String phone) throws MessagingException, UnsupportedEncodingException;

	String kakaoUrl();

	String kakaoGetToken(String code);
	
}