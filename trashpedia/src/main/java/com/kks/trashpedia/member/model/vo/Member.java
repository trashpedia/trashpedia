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
	
	public Member() {
		
	}
	
	
	public Member(int userNo, int roleNo, int gradeNo, String userEmail, String userPwd, String userName,
			String userNickname, String phone, int zipcode, String address1, String address2, String address3,
			Date createDate, Date modifyDate, String status) {
		super();
		this.userNo = userNo;
		this.roleNo = roleNo;
		this.gradeNo = gradeNo;
		this.userEmail = userEmail;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNickname = userNickname;
		this.phone = phone;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}




	public int getUserNo() {
		return userNo;
	}




	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}




	public int getRoleNo() {
		return roleNo;
	}




	public void setRoleNo(int roleNo) {
		this.roleNo = roleNo;
	}




	public int getGradeNo() {
		return gradeNo;
	}




	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}




	public String getUserEmail() {
		return userEmail;
	}




	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}




	public String getUserPwd() {
		return userPwd;
	}




	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}




	public String getUserName() {
		return userName;
	}




	public void setUserName(String userName) {
		this.userName = userName;
	}




	public String getUserNickname() {
		return userNickname;
	}




	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}




	public String getPhone() {
		return phone;
	}




	public void setPhone(String phone) {
		this.phone = phone;
	}




	public int getZipcode() {
		return zipcode;
	}




	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}




	public String getAddress1() {
		return address1;
	}




	public void setAddress1(String address1) {
		this.address1 = address1;
	}




	public String getAddress2() {
		return address2;
	}




	public void setAddress2(String address2) {
		this.address2 = address2;
	}




	public String getAddress3() {
		return address3;
	}




	public void setAddress3(String address3) {
		this.address3 = address3;
	}




	public Date getCreateDate() {
		return createDate;
	}




	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}




	public Date getModifyDate() {
		return modifyDate;
	}




	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", roleNo=" + roleNo + ", gradeNo=" + gradeNo + ", userEmail=" + userEmail
				+ ", userPwd=" + userPwd + ", userName=" + userName + ", userNickname=" + userNickname + ", phone="
				+ phone + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2 + ", address3="
				+ address3 + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
	
	
	
	
}
