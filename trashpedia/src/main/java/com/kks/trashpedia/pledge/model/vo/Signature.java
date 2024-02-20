package com.kks.trashpedia.pledge.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Signature {
	private int signatureNo;
	private int userNo;
	private int pledgeNo;
	private String signatureStatus;
	private Date createDate;
	private Date modifyDate;
}
