package com.kks.trashpedia.report.model.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.report.model.vo.Report;

public interface ReportService {

	Page<Report> getBoardReportList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	Page<Report> getCommentReportList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	//기존 게시글 신고이력 확인
	Report selectReport(Report report);
	
	//게시글 신고등록
	public int insertBoardReport(Report report);


}
