package com.kks.trashpedia.board.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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


@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao dao;

	@Override
	public Post boardDetail(int postNo) {
		return dao.boardDetail(postNo);
	}

	@Override
	public Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect,
			String searchValue) {
		return dao.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
	}

	@Override
	public List<BigCategory> bigCategory() {
		return dao.bigCategory();
	}
	@Override
	public List<SubCategory> subCategory() {
		return dao.subCategory();
	}

	@Override
	public List<Post> categoryList() {
		return dao.categoryList();
	}
	
	// 무료 페이지
	@Override
	public List<Post> getFreeShareList(int subCategoryNo,Pageable pageable, int page) {
		return dao.getFreeTrashList(subCategoryNo, pageable, page);
	}
	
	@Override
	public Post getPostByTitle(String title) {
		return dao.getPostByTitle(title);
	}
	
	// 무료 상세
	@Override
	public Post getFreeTrashDetail(int postNo) {
		return dao.getFreeTrashDetail(postNo);
	}

	@Override
	public ImgAttachment getImageUrl(int boardNo, int imgType) {
		return dao.getImageUrl(boardNo, imgType);
	}
	
	//게시글 상세-첨부파일
	@Override
	public Attachment getDetailAttach(int boardNo) {
		return dao.getDetailAttach(boardNo);
	}

	@Override
	public String getTrashTitleByboardNo(int boardNo) {
		return dao.getTrashTitleByboardNo(boardNo);
	}

	@Override
	public String getTrashContentByboardNo(int boardNo) {
		return dao.getTrashContentByboardNo(boardNo);
	}
	// 무료 페이지
	@Override
	public String getTrashWriterByboardNo(int boardNo) {
		return dao.getTrashWriterByboardNo(boardNo);
	}
	@Override
	public List<Post> getFreeTrashTotalList(int subCategoryNo) {
		return dao.getFreeTrashTotalList(subCategoryNo);
	}


	@Override
	public String getTrashCreateByboardNo(int boardNo) {
		return dao.getTrashCreateByboardNo(boardNo);
	}

	@Override
	public Date getTrashViewsByboardNo(int boardNo) {
		return dao.getTrashViewsByboardNo(boardNo);
	}

	//게시글 조회수 증가
	@Override
	public void increaseCount(Hits hits) {
		dao.increaseCount(hits);
	}

	//게시글조회-페이징,검색
	@Override
	public Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue,
			int subCategoryNo) {
		return dao.loadListData(pageable, page, sort, searchSelect, searchValue,subCategoryNo);
	
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



	
	
}
