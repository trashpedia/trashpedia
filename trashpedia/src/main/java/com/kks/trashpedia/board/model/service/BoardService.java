package com.kks.trashpedia.board.model.service;

import java.util.List;

import com.kks.trashpedia.board.model.vo.Board;

public interface BoardService {


	List<Board> boardList();

	Board boardDetail(int postNo);

}
