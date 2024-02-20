package com.kks.trashpedia.point.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PointHistory {
	private int pointNo;
	private int userNo;
	private Date pointDate;
	private int amount;
	private String pointContent;
}
