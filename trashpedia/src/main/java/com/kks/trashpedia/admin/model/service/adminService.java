package com.kks.trashpedia.admin.model.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.member.model.vo.Member;

public interface adminService {

	int allMember();

	int allBoard();

	int newMember();

	int oldMember();

	List<Member> getMemberData();

	List<?> getBoardData();

	int countAllMember();

	Page<Member> getMember(Pageable pageable);

	Member getMemberDetail(int userNo);

	Member mmDetailMember(int userNo);

	List<Board> mmDetailBoard(int userNo);

	int countBoard(int userNo);

	int countComment(int userNo);

	Page<Board> getBoardList(Pageable pageable, int userNo);

	Board getBoardDetail(int boardNo);

	Page<Comment> getCommentList(Pageable pageable, int userNo);

	Board getCommentDetail(int boardNo);

}
