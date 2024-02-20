package com.kks.trashpedia.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class boardRecommend {
	private int boardNo;
	private int userNo;
	private String like;
	private Date createDate;
	private Date modifyDate;
}
