package com.kks.trashpedia.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NestedComment {
	private int nestedCommentNo;
	private int commentNo;
	private int userNo;
	private String content;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	// adminMain - boardCharts
	private String orderDay;
	private int countNestedComment;
}
