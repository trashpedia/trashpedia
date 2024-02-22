package com.kks.trashpedia.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
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
	
//	admin chart
	private String orderDay;
	private int countMember;
	
//	admin memberManagement Detail
	private String gradeName;
	private String roleName;
	private int point;
}