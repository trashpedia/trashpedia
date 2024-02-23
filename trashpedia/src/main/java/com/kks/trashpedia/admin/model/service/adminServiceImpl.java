package com.kks.trashpedia.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.admin.model.dao.adminDao;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.point.model.vo.PointHistory;
import com.kks.trashpedia.report.model.vo.Report;

@Service
public class adminServiceImpl implements adminService{
	@Autowired
	private adminDao dao;

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
	public Page<Member> getMemberList(Pageable pageable) {
		return dao.getMemberList(pageable);
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
	public Page<Board> getMemberBoardList(Pageable pageable, int userNo) {
		return dao.getMemberBoardList(pageable, userNo);
	}

	@Override
	public Board getMemberBoardDetail(int boardNo) {
		return dao.getMemberBoardDetail(boardNo);
	}

	@Override
	public Page<Board> getMemberCommentList(Pageable pageable, int userNo) {
		return dao.getMemberCommentList(pageable, userNo);
	}

	@Override
	public Board getCommentDetail(int commentNo) {
		return dao.getCommentDetail(commentNo);
	}

	@Override
	public Board getNestedCommentDetail(int nestedCommentNo) {
		return dao.getNestedCommentDetail(nestedCommentNo);
	}

	@Override
	public Page<PointHistory> getMemberPointList(Pageable pageable, int page, int userNo) {
		return dao.getMemberPointList(pageable, page, userNo);
	}

	@Override
	public Page<Report> getMemberReportList(Pageable pageable, int page, int userNo) {
		return dao.getMemberReportList(pageable, page, userNo);
	}

	@Override
	public List<BigCategory> BigCategoryList() {
		return dao.BigCategoryList();
	}

	@Override
	public List<SubCategory> getSubCategoryList(int bigCategoryNo) {
		return dao.getSubCategoryList(bigCategoryNo);
	}

	@Override
	public List<Board> loadBoardListData(int subCategoryNo) {
		return dao.loadBoardListData(subCategoryNo);
	}

	@Override
	public List<Post> loadBoardDetailData(int boardNo) {
		return dao.loadBoardDetailData(boardNo);
	}

}
