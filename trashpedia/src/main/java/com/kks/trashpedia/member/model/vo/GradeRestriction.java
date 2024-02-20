package com.kks.trashpedia.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class GradeRestriction {
	private int restrictionNo;
	private int userNo;
	private String restrictionContent;
	private Date restrictionDate;
	private Date restrictionReleaseDate;
	private String status;
}
