package com.kks.trashpedia.trash.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TrashRecommend {
	private int trashNo;
	private int userNo;
	private String like;
	private Date createDate;
	private Date modifyDate;
}
