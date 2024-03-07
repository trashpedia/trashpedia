package com.kks.trashpedia.common.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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

	// 게시글 수정 페이지 이동
	Post getPost(int postNo);

	// 게시글 수정
	int updatePost(Post p, String deleteImg, String deleteFile, MultipartFile upfile, MultipartFile thumbnailImage, int type) throws IOException;

	// 첨부파일 삭제
	int deleteAttach(Post p);

	//이미지 삭제
	int deleteImage(Post p);

	//파일삭제용 리스트출력
	List<String> fileNameList();

	//이미지삭제용 리스트출력
	List<String> imageNameList();
}
