package com.kks.trashpedia.report.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.report.model.vo.Report;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReportDaoImpl implements ReportDao{
	
	private final SqlSessionTemplate session;

	@Override
	public Report getReport(int reportNo) {
		Report report = session.selectOne("reportMapper.getReport", reportNo);
		report = session.selectOne("reportMapper.getReportDetail", report);
		return report;
	}
	
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
	
	//기존 게시글 신고이력 확인
	@Override
	public Report selectReport(Report report) {
		return session.selectOne("reportMapper.selectReport",report);
	}

	//게시글 신고등록
	@Override
	public int insertBoardReport(Report report) {
		return session.insert("reportMapper.insertBoardReport", report);
	}

	@Override
	public int processingReport(Report report) {
		return session.update("reportMapper.processingReport", report);
	}

	@Override
	public int deleteProcessingReport(Report report) {
		int result = 0;
		if(report.getReportType() == 1) {
			int boardNo = report.getReportTargetNo();
			Post post = session.selectOne("adminMapper.getPost", boardNo);
			int postNo = post.getPostNo();
			result = session.delete("boardMapper.deleteBoard", boardNo);
			if(result > 0) {
				result = session.delete("boardMapper.deletePost", postNo);
			}
		}else if(report.getReportType() == 2) {
			int commentNo = report.getReportTargetNo();
			result = session.delete("adminMapper.deleteComment", commentNo);
		} else {
			int nestedCommentNo = report.getReportTargetNo();
			result = session.delete("adminMapper.deleteNestedComment", nestedCommentNo);
		}
		if(result > 0) {
			return session.update("reportMapper.processingReport", report);
		}
		return result;
	}
}
