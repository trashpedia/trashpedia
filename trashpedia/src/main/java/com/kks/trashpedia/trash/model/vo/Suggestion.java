package com.kks.trashpedia.trash.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Suggestion {
	private int suggestionNo;
	private int userNo;
	private String suggestionTitle;
	private String suggestionContent;
	private Date createDate;
	private String processingStatus;
	private String processingContent;
	private Date processingDate;
}
