package com.kks.trashpedia.auth.model.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.auth.model.dao.AuthDao;
import com.kks.trashpedia.auth.model.dto.UserDetail;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthServiceImpl implements AuthService{

	private final AuthDao authDao;
	
	@Override
	public UserDetails loadUserByUsername(String userEmail) throws UsernameNotFoundException {
		UserDetail userDetail =  (UserDetail) authDao.loadUserByUsername(userEmail);
		if(userDetail == null) {
			throw new UsernameNotFoundException("User not found with email: " + userEmail);
		} else {
			return (UserDetails) userDetail;
		}
	}
}