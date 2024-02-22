package com.kks.trashpedia.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.kks.trashpedia.board.model.vo.Attachment;

@Component
public class FileStore {
	
	//루트경로
	private final String rootPath = System.getProperty("user.dir");
	//루트경로에 있는 files 디렉토리
	private final String fileDir = rootPath + "/files/";
	
	public String getFullPath(String filename) {return fileDir + filename;}
	
	public Attachment storeFile(MultipartFile multipartFile) throws IOException{
		
		if(multipartFile.isEmpty()) { return null; }
		
		//랜덤파일명 생성
		String originName = multipartFile.getOriginalFilename();
	    // 파일명을 중복되지 않게끔 UUID로 정하고 ".확장자"는 그대로
        String changeName = UUID.randomUUID() + "." + extractExt(originName);
        
        //파일저장 -> 파일경로 + storeFilename 에 저장
        multipartFile.transferTo(new File(getFullPath(changeName)));

        Attachment a = new Attachment();
        a.setOriginName(originName);
        a.setChangeName(changeName);
        
        return a;
	}
	
	//파일 여러개인경우
	public List<Attachment> storeFiles(List<MultipartFile> multipartFiles) throws IOException{
		
		List<Attachment> storeFileResult = new ArrayList<>();
		
		for(MultipartFile multipartFile : multipartFiles) {
			if(!multipartFile.isEmpty()) {
				storeFileResult.add(storeFile(multipartFile));
			}
		}
		return storeFileResult;
	}
	
	//확장자 추출
	private String extractExt(String originName) {
		int pos = originName.lastIndexOf(".");
		return originName.substring(pos+1);
	}
	
	

}
