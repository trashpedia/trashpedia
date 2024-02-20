package com.kks.trashpedia.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Report {
	private int ReportNo;
	private int userNo;
	private String reportContent;
	private Date reportDate;
	private int reportType;
	private int reportTargetNo;
	private String processingContent;
	private Date processingDate;
	private String status;
}
