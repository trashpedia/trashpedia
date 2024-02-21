package com.kks.trashpedia.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.common.model.dao.CommonDao;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonDao dao;
	

	//카테고리 가지고오기
	@Override
	public List<SubCategory> getSubCategory(SubCategory subcategory) {
		return  dao.getSubCategory(subcategory);
	}

	
	
	
}
