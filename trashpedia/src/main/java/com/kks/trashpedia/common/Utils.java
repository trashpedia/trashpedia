package com.kks.trashpedia.common;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class Utils {
	
	
	// 파일 저장 함수 - 파일저장 & 파일명 수정 후 파일명 반환
	public static String saveFile(MultipartFile upfile, String savePath) {
		
		//랜덤파일명 생성
		String originName = upfile.getOriginalFilename();
		String currentTime = new java.text.SimpleDateFormat("yyMMddHHmm").format(new java.util.Date());
		int random = (int)(Math.random()*9000+1000); // 1000~9999 4자리 랜덤값
		String ext = originName.substring(originName.indexOf(".")); // .이 시작하는 위치값 찾아서 자름
		
		String changeName = currentTime + random + ext ;
	
		try { //메모리상에 존재하는 파일을 밑에 파일의 경로로 옮겨줌
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
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
