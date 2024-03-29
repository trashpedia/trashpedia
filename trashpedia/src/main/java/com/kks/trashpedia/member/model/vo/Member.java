package com.kks.trashpedia.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Member {
	private String socialId;	
	private String socialType;
	
	private int userNo;
	private String role;
	private int gradeNo;
	private String userEmail;
	private String userPwd;
	private String userName;
	private String userNickname;
	private String phone;
	private String zipcode;
	private String address1;
	private String address2;
	private String address3;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
//	admin chart
	private String orderDay;
	private int countMember;
	
//	admin memberManagement Detail
	private String gradeName;
	private int point;
}