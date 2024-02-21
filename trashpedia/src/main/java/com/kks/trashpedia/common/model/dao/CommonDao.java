package com.kks.trashpedia.common.model.dao;

import java.util.List;

import com.kks.trashpedia.board.model.vo.SubCategory;

public interface CommonDao {

	//카테고리가지고오기
	List<SubCategory> getSubCategory(SubCategory subcategory);

}
