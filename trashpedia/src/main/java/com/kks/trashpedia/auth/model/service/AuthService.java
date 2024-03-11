package com.kks.trashpedia.auth.model.service;

import java.io.UnsupportedEncodingException;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.kks.trashpedia.auth.model.dto.KakaoUserInfoResponse;
import com.kks.trashpedia.auth.model.dto.NaverUserInfoResponse;
import com.kks.trashpedia.member.model.vo.Member;

import jakarta.mail.MessagingException;

public interface AuthService extends UserDetailsService{

	String sendEmail(String userEmail) throws MessagingException, UnsupportedEncodingException;

	int temporaryPwd(String userEmail, String phone) throws MessagingException, UnsupportedEncodingException;

	String kakaoUrl();

	String kakaoGetToken(String code);

	Member getSocialUser(Long socialId);

	Boolean emailCheck(String userEmail);

	int joinMemberSocial(String userEmail, Long socialId);

	KakaoUserInfoResponse getKakaoProperties(String access_Token);

	String naverUrl();

	String naverGetToken(String code);

	NaverUserInfoResponse getNaverProperties(String access_Token);

	Member getSocialUser(String id);

	int joinMemberSocial(String email, String id);
	
}