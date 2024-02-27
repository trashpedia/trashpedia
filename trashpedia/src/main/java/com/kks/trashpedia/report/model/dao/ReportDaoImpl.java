package com.kks.trashpedia.report.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.report.model.vo.Report;

@Repository
public class ReportDaoImpl implements ReportDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Page<Report> getBoardReportList(Pageable pageable) {
		List<Report> r = session.selectList("reportMapper.getBoardReportList");
		int totalCount = session.selectOne("reportMapper.boardReportCount");
		return new PageImpl<>(r, pageable, totalCount);
	}

	@Override
	public Page<Report> getCommentReportList(Pageable pageable) {
		List<Report> r = session.selectList("reportMapper.getCommentReportList");
		int totalCount = session.selectOne("reportMapper.commentReportCount");
		return new PageImpl<>(r, pageable, totalCount);
	}
	
}
