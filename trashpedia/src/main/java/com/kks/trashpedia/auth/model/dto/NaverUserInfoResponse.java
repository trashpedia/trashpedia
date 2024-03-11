package com.kks.trashpedia.auth.model.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class NaverUserInfoResponse {
	private String resultcode;
	private String message;
	private Response response;
	
	@Getter
	public static class Response{
		private String id;
		private String nickname;
		private String name;
		private String email;
		private String mobile;
	}
}
