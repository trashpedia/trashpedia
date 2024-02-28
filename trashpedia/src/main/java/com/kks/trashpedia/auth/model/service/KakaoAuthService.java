package com.kks.trashpedia.auth.model.service;

import java.util.UUID;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.auth.model.dao.AuthDao;
import com.kks.trashpedia.auth.model.dto.KakaoUserInfoResponse;
import com.kks.trashpedia.auth.model.dto.User;
import com.kks.trashpedia.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KakaoAuthService {
	
	private final KakaoUserInfo kakaoUserInfo;
	private final AuthDao dao;
	private final PasswordEncoder encoder;

	public User login(String token) {
		KakaoUserInfoResponse userInfo =  kakaoUserInfo.getUserInfo(token);
		Long socialId = userInfo.getId();
		User user = dao.loadUserByUsername(String.valueOf(socialId));// 첫 로그인이라면 무조건 null
		// 회원가입이 안된 상태.
		if(user == null) {
			//Member, Mebmer_SOCIAL, AUTHROITY테이블들에 데이터 추가.
			String nickName = userInfo.getProperties().getNickname();
			//랜덤 비밀번호
			String password = UUID.randomUUID().toString();
			String encodedPassword = encoder.encode(password);
			String email = userInfo.getKakao_account().getEmail();
			
			Member m = Member
					 .builder()
					 .userEmail(email)
					 .userNickname(nickName)
					 .userPwd(encodedPassword)
					 .socialId(String.valueOf(socialId))
					 .socialType("kakao")
					 .build();
			
			user = dao.insertUserBySocialLogin(m);
		}
		
		return user;
	}

}
