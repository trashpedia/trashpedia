package com.kks.trashpedia.auth.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SocialId {
	private int userNo;
	private OAuthProvider oAuthProvider;
}
