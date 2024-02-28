package com.kks.trashpedia.board.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.trash.model.vo.Trash;

public interface BoardService {
	/* 페이징 */
	Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect,
			String searchValue);

	/* 게시판 상세 */
	Post boardDetail(int postNo);

	/* 카테고리 */
	List<BigCategory> bigCategory();
	List<SubCategory> subCategory();
	List<Post> categoryList();

	
	
	
	
	// 무료 페이지
	List<Trash> getFreeTrashList();
	String getImageUrlByTrashNo(int trashNo);
	String getTrashTitleByTrashNo(int trashNo);
	String getTrashContentByTrashNo(int trashNo);
	// 무료 페이지

	// 무료 상세 페이지
	Trash getFreeTrashDetail(int trashNo);
	String getTrashWriterByTrashNo(int trashNo);
	String getTrashCreateByTrashNo(int trashNo);
	Date getTrashViewsByTrashNo(int trashNo);

}
