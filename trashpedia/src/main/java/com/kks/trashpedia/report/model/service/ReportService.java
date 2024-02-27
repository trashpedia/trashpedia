package com.kks.trashpedia.report.model.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.report.model.vo.Report;

public interface ReportService {

	Page<Report> getBoardReportList(Pageable pageable);

	Page<Report> getCommentReportList(Pageable pageable);

}
