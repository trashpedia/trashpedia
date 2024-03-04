package com.kks.trashpedia.report.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public Page<Report> getBoardReportList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Report> r = session.selectList("reportMapper.getBoardReportList", param, new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("reportMapper.boardReportCount", param);
		return new PageImpl<>(r, pageable, totalCount);
	}

	@Override
	public Page<Report> getCommentReportList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Report> r = session.selectList("reportMapper.getCommentReportList", param, new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("reportMapper.commentReportCount", param);
		return new PageImpl<>(r, pageable, totalCount);
	}
	
}
