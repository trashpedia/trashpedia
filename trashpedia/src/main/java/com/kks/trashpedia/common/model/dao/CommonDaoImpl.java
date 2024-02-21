package com.kks.trashpedia.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.SubCategory;


@Repository
public class CommonDaoImpl implements CommonDao{
	
	@Autowired
	private SqlSessionTemplate session;

//	@Override
//	public List<SubCategory> getSubCategory(int bigcategory, int subcategory) {
//		Map<String, Object> map = new HashMap();
//		
//		map.put("bigCategoryNo",bigcategory);
//		map.put("subCategoryNo",subcategory);
//		
//		//System.out.println("map" + map);
//				
//		return session.selectList("boardMapper.getSubCategory",map);
//	}

	//카테고리 가지고오기
	@Override
	public List<SubCategory> getSubCategory(SubCategory subcategory) {

		return session.selectList("boardMapper.getSubCategory", subcategory);
	}
	
}
