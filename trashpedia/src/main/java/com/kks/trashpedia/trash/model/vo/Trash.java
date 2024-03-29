package com.kks.trashpedia.trash.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Trash {
	private int trashNo;
	private int trashPostNo;
	private int userNo;
	private int subCategoryNo;
	private int bigCategoryNo;
	private String status;
	private String trashInfo;
	private String trashExtraInfo;

	// 관리자 페이지 쓰레기 관리 - 쓰레기 조회
	private String bigCategoryName;
	private String subCategoryName;
	private String trashTitle;
	private Date createDate;
	private Date modifyDate;
	private String changeName;
	private String trashContent;
	
	private int hit;
}
