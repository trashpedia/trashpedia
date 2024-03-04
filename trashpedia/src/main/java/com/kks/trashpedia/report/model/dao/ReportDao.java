package com.kks.trashpedia.report.model.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.report.model.vo.Report;

public interface ReportDao {

	Page<Report> getBoardReportList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	Page<Report> getCommentReportList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

}
