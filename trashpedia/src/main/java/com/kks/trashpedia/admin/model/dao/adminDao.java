package com.kks.trashpedia.admin.model.dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.point.model.vo.PointHistory;
import com.kks.trashpedia.report.model.vo.Report;
import com.kks.trashpedia.trash.model.vo.Request;
import com.kks.trashpedia.trash.model.vo.Suggestion;

public interface adminDao {

	int allMemberCount();

	int allBoardCount();

	int newMemberCount();

	int oldMemberCount();

	List<Member> getMemberChartsData();
	
	List<Board> getBoardChartsData();

	List<Comment> getCommentChartsData();

	ResultSet getBoardData();

	int countAllMember();

	Page<Member> getMemberList(Pageable pageable);

	Member getMemberListDetail(int userNo);

	Member getMemberDetail(int userNo);

	List<Board> mmDetailBoard(int userNo);

	int memberCountBoard(int userNo);

	int memberCountComment(int userNo);

	Page<Board> getMemberBoardList(Pageable pageable, int userNo);

	Board getMemberBoardDetail(int boardNo);

	Page<Board> getMemberCommentList(Pageable pageable, int userNo);

	Board getCommentDetail(int commentNo);

	Board getNestedCommentDetail(int nestedCommentNo);

	Page<PointHistory> getMemberPointList(Pageable pageable, int page, int userNo);

	Page<Report> getMemberReportList(Pageable pageable, int page, int userNo);

	List<BigCategory> BigCategoryList();

	List<SubCategory> getSubCategoryList(int bigCategoryNo);

	List<Board> loadBoardListData(int subCategoryNo);

	Post loadBoardDetailData(int boardNo);

	List<Request> getRequestList();

	List<Suggestion> getSuggestionList();



}
