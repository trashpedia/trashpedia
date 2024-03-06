package com.kks.trashpedia.auth.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberSocial {
	private int socialId;
	private int userNo;
	private String socialType;
}
