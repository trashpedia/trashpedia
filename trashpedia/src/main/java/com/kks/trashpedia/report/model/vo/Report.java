package com.kks.trashpedia.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Report {
	private int reportNo;
	private int userNo;
	private String reportContent;
	private Date reportDate;
	private int reportType;
	private int reportTargetNo;
	private String processingContent;
	private Date processingDate;
	private String status;
	
	// 관리자 페이지 신고 관리
	private String title;
	private int boardNo;
	
	private String content;
	private int commentNo;
	private int nestedCommentNo;
	private String userName;
}
