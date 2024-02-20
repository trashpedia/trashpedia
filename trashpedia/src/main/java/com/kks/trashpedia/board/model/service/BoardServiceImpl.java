package com.kks.trashpedia.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;
	
	
}
