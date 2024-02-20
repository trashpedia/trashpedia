package com.kks.trashpedia.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Hits {
	private int hitsNo;
	private int boardNo;
	private int userNo;
	private Date createDate;
}
