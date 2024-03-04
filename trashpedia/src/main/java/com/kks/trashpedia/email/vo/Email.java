package com.kks.trashpedia.email.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class Email {
	@AllArgsConstructor
	@NoArgsConstructor
	@Data
	public class EmailCheckReq {
	    private String email;
	}
}
