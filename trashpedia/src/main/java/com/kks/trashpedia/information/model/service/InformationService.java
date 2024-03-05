package com.kks.trashpedia.information.model.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.kks.trashpedia.board.model.vo.Post;

public interface InformationService {

	//정보자료글 보기
	Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue, int subCategoryNo);

	
}
