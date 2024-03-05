package com.kks.trashpedia.information.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Post;

@Repository
public class InformationDaoImpl  implements InformationDao{

	@Autowired
	private SqlSessionTemplate session;

	//정보자료글 보기
	@Override
	public Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue, int subCategoryNo) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		param.put("subCategoryNo", subCategoryNo);
		
		List<Post> posts = session.selectList("informationMapper.informationListData",param,new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()) );
		int totalCount = session.selectOne("informationMapper.postListCount",param);
		
		return new PageImpl<>(posts, pageable, totalCount);
		
	}

}
