package com.kks.trashpedia.board.model.dao;

import java.util.List;

import com.kks.trashpedia.board.model.vo.Board;

public interface BoardDao {

	List<Board> boardList();

	Board boardDetail(int postNo);
	

	

}
