package com.kks.trashpedia.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Bookmark {
	private int bookmarkNo;
	private int userNo;
	private int boardNo;
	private String bookmark;
	private Date createDate;
	private Date modifyDate;
}
