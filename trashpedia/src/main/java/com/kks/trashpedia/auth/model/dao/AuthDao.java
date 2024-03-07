package com.kks.trashpedia.auth.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class AuthDao {
	
	private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	private final SqlSessionTemplate session;
	
	public UserDetails loadUserByUsername(String userEmail) {
		return session.selectOne("auth.loadUserByUsername",userEmail);
	}

	public Member findMemberByEmail(String userEmail) {
		 return session.selectOne("auth.findMemberByEmail", userEmail);
	}
	
	public int temporaryPwd(String userEmail, String phone, String authCode) {
		String encodedPassword = passwordEncoder.encode(authCode);
		Map<String, Object> param = new HashMap<>();
		param.put("userEmail", userEmail);
		param.put("userPwd", encodedPassword);
		param.put("phone", phone);
		return session.update("auth.temporaryPwd", param);
	}

	public Member getSocialUser(Long socialId, String socialType) {
		Map<String, Object> param = new HashMap<>();
		param.put("socialId", socialId);
		param.put("socialType", socialType);
		return session.selectOne("auth.loadUserByUsernameSocial", param);
	}

	public Boolean emailCheck(String userEmail) {
		int result = session.selectOne("auth.emailCheck", userEmail);
		if(result > 0) {
			return true;
		}
		return false;
	}

	public int joinMemberSocial(Member m, Long socialId, String sns) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", m.getUserNo());
		param.put("socialId", socialId);
		param.put("sns", sns);
		return session.insert("auth.joinMemberSocial", param);
	}

	public Member getMemberEmail(String userEmail) {
		return session.selectOne("auth.getMemberEmail", userEmail);
	}
}
