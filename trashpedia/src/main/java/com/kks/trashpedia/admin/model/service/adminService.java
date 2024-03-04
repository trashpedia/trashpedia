package com.kks.trashpedia.admin.model.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.point.model.vo.PointHistory;
import com.kks.trashpedia.report.model.vo.Report;
import com.kks.trashpedia.trash.model.vo.Request;
import com.kks.trashpedia.trash.model.vo.Suggestion;
import com.kks.trashpedia.trash.model.vo.Trash;

public interface adminService {

	int allMemberCount();

	int allBoardCount();

	int newMemberCount();

	int oldMemberCount();
	
	int newBoardCount();

	int oldBoardCount();

	List<Member> getMemberChartsData();
	
	List<Board> getBoardChartsData();

	List<Comment> getCommentChartsData();

	int countAllMember();

	Page<Member> getMemberList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	Member getMemberListDetail(int userNo);

	Member getMemberDetail(int userNo);

	List<Board> mmDetailBoard(int userNo);

	int memberCountBoard(int userNo);

	int memberCountComment(int userNo);

	Page<Board> getMemberBoardList(Pageable pageable, int userNo, String sort, String searchSelect, String searchValue);

	Board getMemberBoardDetail(int boardNo);

	Page<Board> getMemberCommentList(Pageable pageable, int userNo, String sort, String searchSelect, String searchValue);

	List<Comment> getCommentDetail(int boardNo, int userNo);

	Page<PointHistory> getMemberPointList(Pageable pageable, int page, int userNo, String sort, String searchSelect, String searchValue);

	Page<Report> getMemberReportList(Pageable pageable, int page, int userNo, String sort, String searchSelect, String searchValue);

	Page<Board> getAnnouncementList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	Page<Board> getBoardList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	Page<Board> getCommentList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	int deleteBoard(int boardNo);

	int undeleteBoard(int boardNo);

	Page<Trash> getTrashList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	Page<Suggestion> getSuggestionList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	Page<Request> getRequestList(Pageable pageable, int page, String sort, String searchSelect, String searchValue);

	int deleteComment(int commentNo);

	int undeleteComment(int commentNo);

	int deleteNestedComment(int nestedCommentNo);

	int undeleteNestedComment(int nestedCommentNo);



}
