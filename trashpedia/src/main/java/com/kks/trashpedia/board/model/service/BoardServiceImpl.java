package com.kks.trashpedia.board.model.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.dao.BoardDao;
import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Hits;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.NestedComment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private final BoardDao dao;

	@Override
	public Board boardDetail(int boardNo) {
		return dao.boardDetail(boardNo);
	}

	@Override
	public Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect, String searchValue) {
		return dao.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
	}

	@Override
	public List<BigCategory> allBigCategory() {
		return dao.allBigCategory();
	}
	@Override
	public List<SubCategory> allSubCategory() {
		return dao.allSubCategory();
	}

	@Override
	public List<Board> allBoardList() {
		return dao.allBoardList();
	}
	
	@Override
	public SubCategory getSubCategoryNo(Post p) {
		return dao.getSubCategoryNo(p);
	}

	@Override
	public int deleteBoard(Post p) {
		return dao.deleteBoard(p);
	}
	
	@Override
	public ImgAttachment getImageUrl(int boardNo, int imgType) {
		return dao.getImageUrl(boardNo, imgType);
	}
	
	//게시글 상세-첨부파일
	@Override
	public Attachment getDetailAttach(int boardNo, int fileType) {
		return dao.getDetailAttach(boardNo, fileType);
	}
	
	@Override
	public Post getPostByTitle(String title) {
		return dao.getPostByTitle(title);
	}
	
	//게시글 조회수 증가
	@Override
	public void increaseCount(Hits hits) {
		dao.increaseCount(hits);
	}

	/*대댓글*/
	@Override
	public int insertNC(NestedComment nc) {
		return dao.insertNC(nc); //삽입
	}

	@Override
	public List<NestedComment> viewNC(int commentNo) {
		return dao.viewNC(commentNo); // 조회
	}

	@Override
	public List<Comment> selectCommentList(Board b) { //commentNo
		return dao.selectCommentList(b);
	}

	@Override 
	public int deleteNC(int nCommentNo) {
		return dao.deleteNC(nCommentNo); //삭제
	}

	// 댓글 point증가
	@Override
	public int increaseUserPoint(int userNo, int amount, String pointContent) {
		return dao.increaseUserPoint(userNo,amount,pointContent); //삭제
	}

	@Override
	public int updateNC(NestedComment nestedComment) {
		return dao.updateNc(nestedComment);
	}
}
