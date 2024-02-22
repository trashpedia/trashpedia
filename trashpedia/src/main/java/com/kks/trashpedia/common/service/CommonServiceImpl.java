package com.kks.trashpedia.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.common.model.dao.CommonDao;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonDao dao;
	
	//카테고리 가지고오기
	@Override
	public SubCategory getSubCategory(SubCategory subcategory) {
		return  dao.getSubCategory(subcategory);
	}

	//게시글 등록(post)
	@Override
	public int createPost(Post p) {
		dao.createPost(p);
		return p.getPostNo();
	}

	//게시글 등록(Board)
	@Override
	public int createBoard(Board b) {
		return  dao.createBoard(b);
	}


	
	
	
	
}
