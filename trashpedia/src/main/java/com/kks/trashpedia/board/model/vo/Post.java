package com.kks.trashpedia.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Post {

	private int postNo;
	private String title;
	private String content;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	private int boardNo;
	private int userNo;
	private int subCategoryNo;
	private int bigCategoryNo;
	private String changeName;
	
	private int hitsNo;
}
