package com.kks.trashpedia.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.report.model.service.ReportService;
import com.kks.trashpedia.report.model.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/report")
public class ReportController {
	
	@Autowired
	private ReportService service;
	

	// 게시글 신고등록
	@PostMapping("/insertBoardReport")
	public int insertReport(Report report) {
		
		log.info("report :  {}", report);
		
		int result = 0;
		
		//기존 신고 확인
		Report existingReport = service.selectReport(report);
		if(existingReport != null) {
			result = 2;
		}else {
			result = service.insertBoardReport(report);
		}
		
		
		return result;
	}
	
	
}