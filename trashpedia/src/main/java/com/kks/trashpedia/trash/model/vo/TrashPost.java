package com.kks.trashpedia.trash.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TrashPost {
	
	private int trashPostNo;
	private String trashTitle;
	private String trashContent;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	private String bigCategoryName;
	private String subCategoryName;
	private int trashHits; //조회수
	
}
