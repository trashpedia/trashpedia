package com.kks.trashpedia.trash.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Request {
	private int requestNo;
	private int trashNo;
	private int userNo;
	private String requestTitle;
	private String requestContent;
	private Date createDate;
	private String processingStatus;
	private String processingContent;
	private Date processingDate;
	
	private String trashTitle;
	private String userName;
}
