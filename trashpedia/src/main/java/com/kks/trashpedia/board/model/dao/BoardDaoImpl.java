package com.kks.trashpedia.board.model.dao;

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

import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Post boardDetail(int postNo) {
		return session.selectOne("boardMapper.boardDetail", postNo);
	}

	@Override
	public Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("filter", filter);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Board> pages = session.selectList("boardMapper.boardList",param, new RowBounds(page, pageable.getPageSize()));
		int totalCount = session.selectOne("boardMapper.boardCount", param);
		return new PageImpl<>(pages, pageable, totalCount);
	}

	@Override
	public List<BigCategory> bigCategory() {
		return session.selectList("boardMapper.bigCategory");
	}

	@Override
	public List<SubCategory> subCategory() {
		return session.selectList("boardMapper.subCategory");
	}

	
	
	
	
}
