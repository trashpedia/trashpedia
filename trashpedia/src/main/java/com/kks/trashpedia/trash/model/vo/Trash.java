package com.kks.trashpedia.trash.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Trash {
	private int trashNo;
	private int imgNo;
	private int postNo;
	private int userNo;
	private int subCategoryNo;
	private String status;
}
