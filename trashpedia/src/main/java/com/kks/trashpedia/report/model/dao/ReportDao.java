package com.kks.trashpedia.report.model.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.report.model.vo.Report;

public interface ReportDao {

	Page<Report> getBoardReportList(Pageable pageable);

	Page<Report> getCommentReportList(Pageable pageable);

}
