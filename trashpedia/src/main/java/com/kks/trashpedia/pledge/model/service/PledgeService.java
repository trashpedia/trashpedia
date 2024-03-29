package com.kks.trashpedia.pledge.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.pledge.model.vo.Signature;

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

	
	//댓글목록조회
	List<Comment> selectCommentList(Board b);
	
	//댓글등록
	int insertComment(Comment c);

	//댓글수정
	int updateComment(Comment comment);

	//댓글삭제
	int deleteComment(Comment comment);

	
	//게시글조회-페이징,검색
	Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue, int subCategoryNo);

	//서약등록
	int insertSignature(Signature signature, Member signatureMember);

	//게시글 내 실천서약조회
	List<Signature> selectSignatureList(int pledgeNo);

	//총 실천서약수
	int countSignature();



}
