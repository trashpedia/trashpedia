package com.kks.trashpedia.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Attachment {
	
	private int fileNo;
	private int refBno;
	private String originName;
	private String changeName;
	private int fileType;
	private Date createDate;
	private Date modifyDate;
	private String status;

}
