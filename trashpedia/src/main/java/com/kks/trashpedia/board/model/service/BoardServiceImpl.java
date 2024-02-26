package com.kks.trashpedia.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.dao.BoardDao;
import com.kks.trashpedia.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;

	@Override
	public List<Board> boardList() {
		return dao.boardList();
	}

	@Override
	public Board boardDetail(int postNo) {
		return dao.boardDetail(postNo);
	}

	
	
}
