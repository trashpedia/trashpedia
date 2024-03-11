package com.kks.trashpedia.auth.model.service;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import com.kks.trashpedia.auth.model.dto.KakaoUserInfoResponse;
import com.kks.trashpedia.auth.model.dto.NaverUserInfoResponse;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;

@RequiredArgsConstructor
@Component
public class UserInfo {

	private final WebClient webClient;
	
	private static final String KAKAO_USER_INFO_URI = "https://kapi.kakao.com/v2/user/me";
	private static final String NAVER_USER_INFO_URI = "https://openapi.naver.com/v1/nid/me";
	
	public KakaoUserInfoResponse getKakaoUserInfo(String accessToken) {
		
		Flux<KakaoUserInfoResponse> response = webClient
				.get()
				.uri(KAKAO_USER_INFO_URI)
				.header("Authorization", "Bearer " + accessToken)
				.retrieve()
				.bodyToFlux(KakaoUserInfoResponse.class);
		return response.blockFirst();
	}

	public NaverUserInfoResponse getNaverUserInfo(String accessToken) {
		
		Flux<NaverUserInfoResponse> response = webClient
				.get()
				.uri(NAVER_USER_INFO_URI)
				.header("Authorization", "Bearer " + accessToken)
				.retrieve()
				.bodyToFlux(NaverUserInfoResponse.class);
		return response.blockFirst();
	}
}