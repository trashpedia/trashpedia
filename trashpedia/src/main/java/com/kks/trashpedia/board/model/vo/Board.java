package com.kks.trashpedia.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Board {
	private int boardNo;
	private int postNo;
	private int userNo;
	private int subCategoryNo;
	private String status;
}
