package com.kks.trashpedia.common;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class Utils {
	
	// 크로스 사이트 스크립트 공격을 방지하기 위한 메소드
	public static String XSSHandling(String content) {
		
		if(content != null ) {
			content = content.replaceAll("&","&amp;"); 
			content = content.replaceAll("<", "&lt;");
			content = content.replaceAll(">", "&gt;");
			content = content.replaceAll("\"", "&quot;");
		}
		
		return content;
	}
	
	
	// 개행문자 처리
	public static String newLineHandling(String content) {
		return content.replaceAll("(\r\n|\r|\n|\n\r)","<br>");
	}
	
	// 개행해제 처리 (글 수정때 사용)
	public static String newLineClear(String content) {
		return content.replaceAll("<br>", "\n"); // br태그를 \n로 바꾸기
	}
	
	

}
