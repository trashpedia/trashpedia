package com.kks.trashpedia.admin.model.dao;

import java.sql.ResultSet;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.member.model.vo.Member;

public interface adminDao {

	int allMember();

	int allBoard();

	int newMember();

	int oldMember();

	List<Member> getMemberData();

	ResultSet getBoardData();

	int countAllMember();

	Page<Member> getMember(Pageable pageable);

	Member getMemberDetail(int userNo);

	Member mmDetailMember(int userNo);

	List<Board> mmDetailBoard(int userNo);

	int countBoard(int userNo);

	int countComment(int userNo);

	Page<Board> getBoardList(Pageable pageable, int userNo);

	Board getBoardDetail(int boardNo);

}
