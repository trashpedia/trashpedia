package com.kks.trashpedia.information.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.information.model.dao.InformationDao;

@Service
public class InformationServiceImpl implements InformationService{

	@Autowired
	private InformationDao dao;

	//정보자료글 보기
	@Override
	public Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue, int subCategoryNo) {
		return dao.loadListData(pageable, page, sort, searchSelect, searchValue,subCategoryNo);
	}

	//홍보자료 게시글 가져오기- 메인페이지용
	@Override
	public List<Post> getinformationList(int subCategoryNo) {
		return dao.getinformationList(subCategoryNo);
	}

	
}
