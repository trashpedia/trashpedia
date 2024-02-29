package com.kks.trashpedia.admin.model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
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

import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.NestedComment;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.point.model.vo.PointHistory;
import com.kks.trashpedia.report.model.vo.Report;
import com.kks.trashpedia.trash.model.vo.Request;
import com.kks.trashpedia.trash.model.vo.Suggestion;
import com.kks.trashpedia.trash.model.vo.Trash;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int allMemberCount() {
		return session.selectOne("adminMapper.allMemberCount");
	}

	@Override
	public int allBoardCount() {
		return session.selectOne("adminMapper.allBoardCount");
	}

	@Override
	public int newMemberCount() {
		return session.selectOne("adminMapper.newMemberCount");
	}

	@Override
	public int oldMemberCount() {
		return session.selectOne("adminMapper.oldMemberCount");
	}
	
	@Override
	public int newBoardCount() {
		return session.selectOne("adminMapper.newBoardCount");
	}

	@Override
	public int oldBoardCount() {
		return session.selectOne("adminMapper.oldBoardCount");
	}

	@Override
	public List<Member> getMemberChartsData() {
		return session.selectList("adminMapper.getMemberChartsData");
	}
	
	@Override
	public List<Board> getBoardChartsData() {
		return session.selectList("adminMapper.getBoardChartsData");
	}

	@Override
	public List<Comment> getCommentChartsData() {
	    List<Comment> comments = session.selectList("adminMapper.getCommentChartsData");
	    List<NestedComment> nestedComments = session.selectList("adminMapper.getNCChartsData");

	    List<Comment> mergedList = new ArrayList<>();
	    for (int i = 0; i < comments.size(); i++) {
	        Comment comment = comments.get(i);
	        NestedComment nestedComment = nestedComments.get(i);
	        
	        int totalCount = comment.getCountComment() + nestedComment.getCountNestedComment();
	        comment.setCountComment(totalCount);
	        
	        mergedList.add(comment);
	    }
	    return mergedList;
	}
	
	@Override
	public ResultSet getBoardData() {
		return null;
	}

	@Override
	public int countAllMember() {
		return session.selectOne("adminMapper.getCountAllMember");
	}

	@Override
	public Page<Member> getMemberList(Pageable pageable, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Member> members = session.selectList("adminMapper.getMemberList", param, new RowBounds((int) pageable.getOffset(), pageable.getPageSize()));
        int totalCount = session.selectOne("adminMapper.getCountAllMember", param);
        return new PageImpl<>(members, pageable, totalCount);
	}

	@Override
	public Member getMemberListDetail(int userNo) {
		return session.selectOne("adminMapper.getMemberDetail",userNo);
	}

	@Override
	public Member getMemberDetail(int userNo) {
		return session.selectOne("adminMapper.getMemberDetail",userNo);
	}

	@Override
	public List<Board> mmDetailBoard(int userNo) {
		return session.selectList("adminMapper.getBoardList",userNo);
	}

	@Override
	public int memberCountBoard(int userNo) {
		return session.selectOne("adminMapper.memberCountBoard",userNo);
	}

	@Override
	public int memberCountComment(int userNo) {
		return session.selectOne("adminMapper.memberCountComment",userNo);
	}

	@Override
	public Page<Board> getMemberBoardList(Pageable pageable, int userNo, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", userNo);
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Board> boards = session.selectList("adminMapper.getMemberBoardList", param, new RowBounds((int) pageable.getOffset(), pageable.getPageSize()));
        int totalCount = session.selectOne("adminMapper.memberCountBoard", userNo);
        return new PageImpl<>(boards, pageable, totalCount);
	}

	@Override
	public Board getMemberBoardDetail(int boardNo) {
		return session.selectOne("adminMapper.getMemberBoardDetail",boardNo);
	}

	@Override
	public Page<Board> getMemberCommentList(Pageable pageable, int userNo, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", userNo);
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Board> comments = session.selectList("adminMapper.getMemberCommentList", param, new RowBounds((int)pageable.getOffset(),pageable.getPageSize()));
		int totalCount = session.selectOne("adminMapper.memberCountComment", userNo);
		return new PageImpl<>(comments, pageable, totalCount);
	}

	@Override
	public List<Comment> getCommentDetail(int boardNo, int userNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", userNo);
		param.put("boardNo", boardNo);
		return session.selectList("adminMapper.getCommentDetail",param);
	}


	@Override
	public Page<PointHistory> getMemberPointList(Pageable pageable, int page, int userNo, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", userNo);
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<PointHistory> ph = session.selectList("adminMapper.getMemberPointList", param, new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("adminMapper.memberPointCount", param);
		return new PageImpl<>(ph, pageable, totalCount);
	}

	@Override
	public Page<Report> getMemberReportList(Pageable pageable, int page, int userNo, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("userNo", userNo);
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Report> r = session.selectList("adminMapper.getMemberReportList", param, new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("adminMapper.memberReportCount", param);
		return new PageImpl<>(r, pageable, totalCount);
	}

	@Override
	public List<BigCategory> BigCategoryList() {
		return session.selectList("adminMapper.BigCategoryList");
	}

	@Override
	public List<SubCategory> getSubCategoryList(int bigCategoryNo) {
		return session.selectList("adminMapper.getSubCategoryList",bigCategoryNo);
	}

	@Override
	public Page<Board> loadBoardListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Board> boards = session.selectList("adminMapper.loadBoardListData",param, new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("adminMapper.boardListCount",param);
		return new PageImpl<>(boards, pageable, totalCount);
	}
	
	@Override
	public Page<Board> loadCommentListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Board> boards = session.selectList("adminMapper.loadCommentListData",param, new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("adminMapper.commentListCount",param);
		return new PageImpl<>(boards, pageable, totalCount);
	}

	@Override
	public Page<Trash> getTrashList(Pageable pageable, int page) {
		List<Trash> t = session.selectList("adminMapper.getTrashList", null, new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("adminMapper.trashCount");
		return new PageImpl<>(t, pageable, totalCount);
	}

	@Override
	public Page<Suggestion> loadSuggestionListData(Pageable pageable) {
		List<Suggestion> s = session.selectList("adminMapper.loadSuggestionListData");
		int totalCount = session.selectOne("adminMapper.suggestionCount");
		return new PageImpl<>(s, pageable, totalCount);
	}

	@Override
	public Page<Request> loadRequestListData(Pageable pageable) {
		List<Request> r = session.selectList("adminMapper.loadRequestListData");
		int totalCount = session.selectOne("adminMapper.requestCount");
		return new PageImpl<>(r, pageable, totalCount);
	}

	@Override
	public int loadBoardCount(int subCategoryNo) {
		return session.selectOne("adminMapper.boardListCount",subCategoryNo);
	}
}
