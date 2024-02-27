package com.kks.trashpedia.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Post> boardList(int subCategoryNo) {
		return session.selectList("boardMapper.boardList", subCategoryNo);
	}

	@Override
	public Board boardDetail(int postNo) {
		return session.selectOne("boardMapper.boardDetail", postNo);
	}

	
	
	
	
}
