package com.kks.trashpedia.common.model.dao;

import java.util.List;

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

	//게시글수정페이지 이동
	Post getPost(int postNo);

	//게시글수정
	int updatePost(Post p);

	//첨부파일삭제
	int deleteAttach(Post p);

	//이미지삭제
	int deleteImage(Post p);

	//파일삭제-파일리스트출력
	List<String> fileNameList();

	//파일삭제-이미지리스트출력
	List<String> imageNameList();

	void deleteImage(int trashNo);

}
