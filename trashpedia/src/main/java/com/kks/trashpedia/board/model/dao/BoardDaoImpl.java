package com.kks.trashpedia.board.model.dao;

import java.util.List;

import org.apache.ibatis.jdbc.SQL;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Board> boardList() {
		return session.selectList("boardMapper.boardList");
	}

	@Override
	public Board boardDetail(int postNo) {
		return session.selectList("boardMapper.boardDetail");
	}

	
	
	
	
}
