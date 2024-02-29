package com.kks.trashpedia.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Comment {
	private int commentNo;
	private int boardNo;
	private int userNo;
	private String content;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	// adminMain = BoardCharts
	private String orderDay;
	private int countComment;
	
	private int hit;
	
	private String title;
	private String subCategoryName;
}
