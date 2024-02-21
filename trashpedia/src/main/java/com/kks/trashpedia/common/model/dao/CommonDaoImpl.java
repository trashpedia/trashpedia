package com.kks.trashpedia.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;


@Repository
public class CommonDaoImpl implements CommonDao{
	
	@Autowired
	private SqlSessionTemplate session;

	//카테고리 가지고오기
	@Override
	public SubCategory getSubCategory(SubCategory subcategory) {
		return session.selectOne("boardMapper.getSubCategory", subcategory);
	}

	//게시글등록(Post)
	@Override
	public int createPost(Post p) {
		return session.insert("boardMapper.createPost",p);
	}

	//게시글등록(Board)
	@Override
	public int createBoard(Board b) {
		System.out.println("commonDaoImpl실행확인");
		System.out.println(b);
		System.out.println(session.insert("boardMapper.createBoard",b));
		
		return session.insert("boardMapper.createBoard",b);
	}

	
}
