package com.kks.trashpedia.trash.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TrashSubCategory {
	private int subCategoryNo;
	private int bigCategoryNo;
	private String subCategoryName;
}
