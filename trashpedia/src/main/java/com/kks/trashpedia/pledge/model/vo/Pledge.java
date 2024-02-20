package com.kks.trashpedia.pledge.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Pledge {
	private int pledgeNo;
	private int imgNo;
	private String title;
	private Date createDate;
	private Date modifyDate;
	private String status;
}
