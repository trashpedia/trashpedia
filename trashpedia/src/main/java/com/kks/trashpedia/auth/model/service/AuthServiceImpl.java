package com.kks.trashpedia.auth.model.service;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.auth.model.dao.AuthDao;
import com.kks.trashpedia.auth.model.dto.User;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthServiceImpl implements AuthService{

	private final AuthDao authDao;
	
	@Override
	public User loadUserByUsername(String socialId) throws UsernameNotFoundException {
		return authDao.loadUserByUsername(Long.parseLong(socialId) ,"kakao");
	}
}
