package com.kks.trashpedia.board.model.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

public interface BoardService {
	/*페이징*/
	Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect, String searchValue);
	/*게시판 상세*/
	Post boardDetail(int postNo);
	/*카테고리*/
	List<BigCategory> bigCategory();
	List<SubCategory> subCategory();
	List<Post> categoryList();
	
	
}
