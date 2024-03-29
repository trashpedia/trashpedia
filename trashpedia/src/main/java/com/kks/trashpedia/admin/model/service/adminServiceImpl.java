package com.kks.trashpedia.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.admin.model.dao.AdminDao;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.point.model.vo.PointHistory;
import com.kks.trashpedia.report.model.vo.Report;
import com.kks.trashpedia.trash.model.vo.Request;
import com.kks.trashpedia.trash.model.vo.Suggestion;
import com.kks.trashpedia.trash.model.vo.Trash;

@Service
public class adminServiceImpl implements adminService{
	@Autowired
	private AdminDao dao;

	@Override
	public int allMemberCount() {
		return dao.allMemberCount();
	}

	@Override
	public int allBoardCount() {
		return dao.allBoardCount();
	}

	@Override
	public int newMemberCount() {
		return dao.newMemberCount();
	}

	@Override
	public int oldMemberCount() {
		return dao.oldMemberCount();
	}

	@Override
	public int newBoardCount() {
		return dao.newBoardCount();
	}

	@Override
	public int oldBoardCount() {
		return dao.oldBoardCount();
	}
	
	@Override
	public List<Member> getMemberChartsData() {
		return dao.getMemberChartsData();
	}
	
	@Override
	public List<Board> getBoardChartsData() {
		return dao.getBoardChartsData();
	}

	@Override
	public List<Comment> getCommentChartsData() {
		return dao.getCommentChartsData();
	}

	@Override
	public int countAllMember() {
		return dao.countAllMember();
	}

	@Override
	public Page<Member> getMemberList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getMemberList(pageable, page, sort, searchSelect, searchValue);
	}

	@Override
	public Member getMemberListDetail(int userNo) {
		return dao.getMemberListDetail(userNo);
	}

	@Override
	public Member getMemberDetail(int userNo) {
		return dao.getMemberDetail(userNo);
	}

	@Override
	public List<Board> mmDetailBoard(int userNo) {
		return dao.mmDetailBoard(userNo);
	}

	@Override
	public int memberCountBoard(int userNo) {
		return dao.memberCountBoard(userNo);
	}

	@Override
	public int memberCountComment(int userNo) {
		return dao.memberCountComment(userNo);
	}

	@Override
	public Page<Board> getMemberBoardList(Pageable pageable, int userNo, String sort, String searchSelect, String searchValue) {
		return dao.getMemberBoardList(pageable, userNo, sort, searchSelect, searchValue);
	}

	@Override
	public Board getMemberBoardDetail(int boardNo) {
		return dao.getMemberBoardDetail(boardNo);
	}

	@Override
	public Page<Board> getMemberCommentList(Pageable pageable, int userNo, String sort, String searchSelect, String searchValue) {
		return dao.getMemberCommentList(pageable, userNo, sort, searchSelect, searchValue);
	}

	@Override
	public List<Comment> getCommentDetail(int boardNo, int userNo) {
		return dao.getCommentDetail(boardNo, userNo);
	}

	@Override
	public Page<PointHistory> getMemberPointList(Pageable pageable, int page, int userNo, String sort, String searchSelect, String searchValue) {
		return dao.getMemberPointList(pageable, page, userNo, sort, searchSelect, searchValue);
	}

	@Override
	public Page<Report> getMemberReportList(Pageable pageable, int page, int userNo, String sort, String searchSelect, String searchValue) {
		return dao.getMemberReportList(pageable, page, userNo, sort, searchSelect, searchValue);
	}

	@Override
	public Page<Board> getAnnouncementList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getAnnouncementList(pageable, page, sort, searchSelect, searchValue);
	}

	@Override
	public Page<Board> getBoardList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getBoardList(pageable, page, sort, searchSelect, searchValue);
	}

	@Override
	public Page<Board> getCommentList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getCommentList(pageable, page, sort, searchSelect, searchValue);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}

	@Override
	public int undeleteBoard(int boardNo) {
		return dao.undeleteBoard(boardNo);
	}


	@Override
	public int deleteComment(int commentNo) {
		return dao.deleteComment(commentNo);
	}

	@Override
	public int undeleteComment(int commentNo) {
		return dao.undeleteComment(commentNo);
	}

	@Override
	public int deleteNestedComment(int nestedCommentNo) {
		return dao.deleteNestedComment(nestedCommentNo);
	}

	@Override
	public int undeleteNestedComment(int nestedCommentNo) {
		return dao.undeleteNestedComment(nestedCommentNo);
	}
	
	@Override
	public Page<Trash> getTrashList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getTrashList(pageable, page, sort, searchSelect, searchValue);
	}

	@Override
	public Page<Suggestion> getSuggestionList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getSuggestionList(pageable, page, sort, searchSelect, searchValue);
	}

	@Override
	public Page<Request> getRequestList(Pageable pageable, int page, String sort, String searchSelect, String searchValue) {
		return dao.getRequestList(pageable, page, sort, searchSelect, searchValue);
	}

}
