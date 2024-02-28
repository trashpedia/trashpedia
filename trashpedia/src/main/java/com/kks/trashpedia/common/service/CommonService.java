package com.kks.trashpedia.common.service;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

public interface CommonService {

	// 카테고리 정보 가지고오기
	SubCategory getSubCategory(SubCategory subcategory);

	// 게시글 등록
	int createPost(Post p);

	int createBoard(Board b);

	int insertFiles(Attachment attachment, ImgAttachment image);

	// 게시글 수정
	Post getPost(int postNo);

}
