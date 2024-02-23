package com.kks.trashpedia.common.model.dao;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

public interface CommonDao {

	//카테고리가지고오기
	SubCategory getSubCategory(SubCategory subcategory);

	//게시글등록(post)
	int createPost(Post p);

	//게시글등록(board)
	int createBoard(Board b);

	//첨부파일등록
	int insertAttachment(Attachment attachment);

	//이미지등록
	int insertImgAttachment(ImgAttachment image);

}
