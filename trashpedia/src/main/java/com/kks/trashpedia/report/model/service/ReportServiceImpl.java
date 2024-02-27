package com.kks.trashpedia.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.report.model.dao.ReportDao;
import com.kks.trashpedia.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDao dao;

	@Override
	public Page<Report> getBoardReportList(Pageable pageable) {
		return dao.getBoardReportList(pageable);
	}

	@Override
	public Page<Report> getCommentReportList(Pageable pageable) {
		return dao.getCommentReportList(pageable);
	}
	
	
}
