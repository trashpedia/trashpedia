package com.kks.trashpedia.trash.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
import com.kks.trashpedia.trash.model.vo.TrashPost;
import com.kks.trashpedia.trash.model.vo.TrashSubCategory;

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

	@Override
	public Trash trashDetail(int trashNo) {
		Trash t = session.selectOne("trashMapper.trashDetail", trashNo);
		System.out.println(t);
		return session.selectOne("trashMapper.trashDetail", trashNo);
	}


	@Override
	public List<TrashPost> getSimilarList(int trashNo) {
		Trash t = session.selectOne("trashMapper.bringCategory", trashNo);
		System.out.println(t);
		return session.selectList("trashMapper.getSimilarList",t);
	}

	@Override
	public List<TrashBigCategory> getBigCategoryList() {
		return session.selectList("trashMapper.getBigCategoryList");
	}

	@Override
	public List<TrashSubCategory> getSubCategoryList() {
		return session.selectList("trashMapper.getSubCategoryList");
	}

	@Override
	public List<Trash> getAllTrashList() {
		return session.selectList("trashMapper.getAllTrashList");
	}
}
