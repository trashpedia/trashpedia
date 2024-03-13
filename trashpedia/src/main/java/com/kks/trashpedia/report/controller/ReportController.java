package com.kks.trashpedia.report.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.report.model.service.ReportService;
import com.kks.trashpedia.report.model.vo.Report;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/report")
@RequiredArgsConstructor
public class ReportController {
	
	private final ReportService service;
	
	@GetMapping("/{reportNo}")
	public Report getReport(@PathVariable int reportNo) {
		return service.getReport(reportNo);
	}
	
	// 게시글 신고등록
	@PostMapping("/insertBoardReport")
	public int insertReport(Report report) {
		log.info("report :  {}", report);
		int result = 0;
		Report existingReport = service.selectReport(report);
		if(existingReport != null) {
			result = 2;
		}else {
			result = service.insertBoardReport(report);
		}
		return result;
	}
	
	@PostMapping("/processing/{reportNo}")
	public int processingReport(Report report) {
		return service.processingReport(report);
	}
	
	@PostMapping("/deleteProcessing/{reportNo}")
	public int deleteProcessingReport(Report report) {
		return service.deleteProcessingReport(report);
	}
}