package com.kks.trashpedia.auth.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AuthDao {
	
	private final SqlSessionTemplate session;
	
	public UserDetails loadUserByUsername(String userEmail) {
		return session.selectOne("auth.loadUserByUsername",userEmail);
	}

	public Member findMemberByEmail(String userEmail) {
		 return session.selectOne("auth.findMemberByEmail", userEmail);
	}
}
