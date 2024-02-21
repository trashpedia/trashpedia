package com.kks.trashpedia;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Image {
//	IMG_NO	NUMBER
//	REF_BNO	NUMBER
//	ORIGIN_NAME	VARCHAR2(300 BYTE)
//	CHANGE_NAME	VARCHAR2(300 BYTE)
//	IMG_LEVEL	NUMBER
//	IMG_TYPE	NUMBER
//	CREATE_DATE	DATE
//	MODIFY_DATE	DATE
//	STATUS	VARCHAR2(1 BYTE)
	
	private int imgNo;
	private int refBno;
	private String originName;
	private String changeName;
	private int imgLevel;
	private int imgType;
	private LocalDate createDate;
	private LocalDate modifyDate;
	private char status;
	
}
