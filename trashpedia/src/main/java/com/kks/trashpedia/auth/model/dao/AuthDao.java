package com.kks.trashpedia.auth.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.auth.model.dto.User;
import com.kks.trashpedia.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AuthDao {
	
	private final SqlSessionTemplate session;
	
	public User loadUserByUsername(String socialId) {
		return session.selectOne("auth.loadUserByUsername" , socialId); // userName
	}

	public User insertUserBySocialLogin(Member m) {
		//1) Member 테이블추가 
		session.insert("auth.insertUserBySocialLogin" , m);
		//2) Member_Social테이블에 추가
		session.insert("auth.insertUserSocialBySocialLogin" , m);
		//3) Authroity테이블에 추가
		session.insert("auth.insertUserAuthorityBySocialLogin" , m);
		//4) loadUserByUsername함수호출하여 반환값 전달.
		return this.loadUserByUsername( m.getSocialId());
	}

	public Member findMemberByEmail(String userEmail) {
		 return session.selectOne("auth.findMemberByEmail", userEmail);
	}
	
}
