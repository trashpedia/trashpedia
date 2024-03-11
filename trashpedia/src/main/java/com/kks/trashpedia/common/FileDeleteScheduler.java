package com.kks.trashpedia.common;

import java.io.File;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kks.trashpedia.common.service.CommonService;

import jakarta.servlet.ServletContext;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class FileDeleteScheduler {
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private CommonService service;
	
	//파일삭제 스케쥴러
	@Scheduled(cron = "0 0 */12 * * *")  // 서버 실행 후 12시간 간격으로 실행됨
	public void deleteFile() {
		
		List<String> fileNameList = service.fileNameList();
		
		File filePath = new File(application.getRealPath("/resources/attachFile/file/"));
		File[] files = filePath.listFiles(); // 현재 디렉토리의 모든 파일을 배열로 가져옴
		List<File> fileList = Arrays.asList(files);
		
		int count = 0;
		if(!fileNameList.isEmpty()) {
			
			for(File serverFile : fileList) {
				String fileName = serverFile.getName(); //파일명 가져오기
				String filePathName = "/resources/attachFile/file/" + fileName;
				if(!fileNameList.contains(filePathName)) {
					log.info(fileName+"을 삭제합니다.");
					count++;
					serverFile.delete();
				}
			}
		}
		log.info("총 {}개의 파일이 삭제되었습니다.",count);
	}
	
	//이미지삭제 스케쥴러
	@Scheduled(cron = "0 0 */12 * * *")  //서버 실행 후 3분 간격으로 실행됨
	public void deleteImage() {
		
		List<String> fileNameList = service.imageNameList();
		
		File filePath = new File(application.getRealPath("/resources/attachFile/image/"));
		File[] files = filePath.listFiles(); // 현재 디렉토리의 모든 파일을 배열로 가져옴
		List<File> fileList = Arrays.asList(files);
		
		int count = 0;
		if(!fileNameList.isEmpty()) {
			
			for(File serverFile : fileList) {
				String fileName = serverFile.getName(); //파일명 가져오기
				String filePathName = "/resources/attachFile/image/" + fileName;
				if(!fileNameList.contains(filePathName)) {
					log.info(fileName+"을 삭제합니다.");
					count++;
					serverFile.delete();
				}
			}
		}
		log.info("총 {}개의 이미지가 삭제되었습니다.",count);
	}
	

}
