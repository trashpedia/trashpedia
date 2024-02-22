package com.kks.trashpedia.admin.model.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.member.model.vo.Member;

public interface adminService {

	int allMemberCount();

	int allBoardCount();

	int newMemberCount();

	int oldMemberCount();

	List<Member> getMemberChartsData();
	
	List<Board> getBoardChartsData();

	List<Comment> getCommentChartsData();

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

	Board getCommentDetail(int boardNo);


}
