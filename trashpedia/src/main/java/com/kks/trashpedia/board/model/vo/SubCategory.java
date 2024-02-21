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
	private String bigCategoryName; //대분류 카테고리 이름 가져오기 위함
}
