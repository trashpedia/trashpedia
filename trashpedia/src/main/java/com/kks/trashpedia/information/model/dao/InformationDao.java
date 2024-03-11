package com.kks.trashpedia.information.model.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Post;

public interface InformationDao  {

	//정보자료글보기
	Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue, int subCategoryNo);

	//홍보자료 게시글 가져오기- 메인페이지용
	List<Post> getinformationList(int subCategoryNo);

}
