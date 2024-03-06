package com.kks.trashpedia.auth.model.service;

import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

import com.kks.trashpedia.auth.model.dto.KakaoUserInfoResponse;

import lombok.RequiredArgsConstructor;
import reactor.core.publisher.Flux;

@RequiredArgsConstructor
@Component
public class KakaoUserInfo {

	private final WebClient webClient;
	
	private static final String KAKAO_USER_INFO_URI = "https://kapi.kakao.com/v2/user/me";
	
	public KakaoUserInfoResponse getUserInfo(String accessToken) {
		
		Flux<KakaoUserInfoResponse> response = webClient
				.get()
				.uri(KAKAO_USER_INFO_URI)
				.header("Authorization", "Bearer " + accessToken)
				.retrieve()
				.bodyToFlux(KakaoUserInfoResponse.class);
		
		return response.blockFirst();
	}
	
	
	
	
}