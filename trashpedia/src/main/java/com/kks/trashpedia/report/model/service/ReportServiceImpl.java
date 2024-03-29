package com.kks.trashpedia.report.model.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.report.model.dao.ReportDao;
import com.kks.trashpedia.report.model.vo.Report;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService{
	
	private final ReportDao dao;

	@Override
	public Report getReport(int reportNo) {
		return dao.getReport(reportNo);
	}
	
	@Override
	public Page<Report> getBoardReportList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getBoardReportList(pageable, page, sort, searchSelect, searchValue);
	}

	@Override
	public Page<Report> getCommentReportList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getCommentReportList(pageable, page, sort, searchSelect, searchValue);
	}
	
	//기존 게시글 신고이력 확인
	@Override
	public Report selectReport(Report report) {
		return dao.selectReport(report);
	}

	//게시글 신고등록
	@Override
	public int insertBoardReport(Report report) {
		return dao.insertBoardReport(report);
	}

	@Override
	public int processingReport(Report report) {
		return dao.processingReport(report);
	}

	@Override
	public int deleteProcessingReport(Report report) {
		return dao.deleteProcessingReport(report);
	}
}
