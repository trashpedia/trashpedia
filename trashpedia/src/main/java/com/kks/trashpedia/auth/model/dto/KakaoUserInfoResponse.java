package com.kks.trashpedia.auth.model.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class KakaoUserInfoResponse {
	private String id;
	private Boolean has_signed_up;
	private String connected_at;
	private String synched_at;
	private KakaoProperties properties;
	private KakaoAccount kakao_account;
	
	@Getter
	public static class KakaoProperties{
		private String nickname;
		private String profile_image;
		private String thumbnail_image;
	}
	
	@Getter
	public static class KakaoAccount{
		private Boolean profile_needs_agreement;
		private KakaoProfile profile;
		private Boolean email_needs_agreement;
		private String email;
		private Boolean name_needs_agreement;
		private String name;
		private Boolean phone_number_needs_agreement;
		private String phone_number;
	}
	
	@Getter
	public static class KakaoProfile {
		private String nickname;
		private String thumbnail_image_url;
		private String profile_image_rul;
		private Boolean is_default_image;
	}
}
