package com.kks.trashpedia.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SubCategory {
	private int subCategoryNo;
	private int bigCategoryNo;
	private String subCategoryName;
}
