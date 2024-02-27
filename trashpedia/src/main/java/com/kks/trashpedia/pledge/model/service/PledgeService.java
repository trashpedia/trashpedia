package com.kks.trashpedia.pledge.model.service;

import java.sql.Date;
import java.util.List;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

public interface PledgeService {

	// 실천하기 게시글 리스트 조회
	List<Post> pledgeList(int subCategoryNo);

	//게시글 상세조회
	Post pledgeDetail(int postNo);
	//게시글 상세 이미지
	ImgAttachment pledgeDetailImg(int boardNo);
	//게시글 상세 첨부파일
	Attachment pledgeDetailAttach(int boardNo);
	
	//처음 조회일 조회
	Date pledgeHitDate(Board b);
	//게시글 조회수 증가
	int increaseCount(Board b);

	//게시글 삭제
	int pledgeDeletePost(Post p);
	int pledgeDeleteBoard(Post p);

	//카테고리정보 가져오기
	SubCategory getCategoryNo(Post p);



}
