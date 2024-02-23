package com.kks.trashpedia.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
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
		 dao.createBoard(b);
		return b.getBoardNo();
	}
	
	//파일&이미지 등록
	@Override
	public int insertFiles(Attachment attachment, ImgAttachment image) {
		
		int result1 = 1;
		int result2 = 1;
		
		if(attachment != null) {
			result1 = dao.insertAttachment(attachment);
		}
		if(image != null) {
			result2 = dao.insertImgAttachment(image);
		}
				
		return result1*result2;
	}


	
	
	
	
}
