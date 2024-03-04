package com.kks.trashpedia.trash.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.trash.model.vo.TrashPost;

@Repository
public class TrashDaoImpl implements TrashDao{
	@Autowired
	private SqlSessionTemplate session;

	//최근 업데이트된 쓰레기
	@Override
	public List<TrashPost> getRecentlyTrashList() {
		return session.selectList("trashMapper.getRecentlyTrashList");
	}

	@Override
	public List<TrashPost> getPopularList() {
		return session.selectList("trashMapper.getPopularList");
	}
	
	
}
