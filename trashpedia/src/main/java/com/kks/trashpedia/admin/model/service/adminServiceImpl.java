package com.kks.trashpedia.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.admin.model.dao.adminDao;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.member.model.vo.Member;

@Service
public class adminServiceImpl implements adminService{
	@Autowired
	private adminDao dao;

	@Override
	public int allMember() {
		return dao.allMember();
	}

	@Override
	public int allBoard() {
		return dao.allBoard();
	}

	@Override
	public int newMember() {
		return dao.newMember();
	}

	@Override
	public int oldMember() {
		return dao.oldMember();
	}

	@Override
	public List<Member> getMemberData() {
		return dao.getMemberData();
	}

	@Override
	public List<?> getBoardData() {
		return null;
	}

	@Override
	public int countAllMember() {
		return dao.countAllMember();
	}

	@Override
	public Page<Member> getMember(Pageable pageable) {
		return dao.getMember(pageable);
	}

	@Override
	public Member getMemberDetail(int userNo) {
		return dao.getMemberDetail(userNo);
	}

	@Override
	public Member mmDetailMember(int userNo) {
		return dao.mmDetailMember(userNo);
	}

	@Override
	public List<Board> mmDetailBoard(int userNo) {
		return dao.mmDetailBoard(userNo);
	}

	@Override
	public int countBoard(int userNo) {
		return dao.countBoard(userNo);
	}

	@Override
	public int countComment(int userNo) {
		return dao.countComment(userNo);
	}

	@Override
	public Page<Board> getBoardList(Pageable pageable, int userNo) {
		return dao.getBoardList(pageable, userNo);
	}

	@Override
	public Board getBoardDetail(int boardNo) {
		return dao.getBoardDetail(boardNo);
	}

	@Override
	public Page<Comment> getCommentList(Pageable pageable, int userNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board getCommentDetail(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 절취선
	
}
