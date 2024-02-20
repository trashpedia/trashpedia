package com.kks.trashpedia.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int userNo;
	private int roleNo;
	private int gradeNo;
	private String userEmail;
	private String userPwd;
	private String userName;
	private String userNickname;
	private String phone;
	private int zipcode;
	private String address1;
	private String address2;
	private String address3;
	private Date createDate;
	private Date modifyDate;
	private String status;
}
