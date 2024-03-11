package com.kks.trashpedia.trash.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
import com.kks.trashpedia.trash.model.vo.TrashPost;
import com.kks.trashpedia.trash.model.vo.TrashSubCategory;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TrashDaoImpl implements TrashDao{
	
	private final SqlSessionTemplate session;

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
		return session.selectOne("trashMapper.trashDetail", trashNo);
	}


	@Override
	public List<TrashPost> getSimilarList(int trashNo) {
		Trash t = session.selectOne("trashMapper.bigCategory", trashNo);
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
	public List<Trash> getAllTrashList(Map<String, Object> map) {
		return session.selectList("trashMapper.getAllTrashList",map);
	}

	@Override
	public List<TrashSubCategory> getSubCategoryList(int bigCategoryNo) {
		return session.selectList("trashMapper.getSubCategoryList", bigCategoryNo);
	}

	@Override
	public int writeTrash(TrashPost tp, TrashSubCategory tsc, int userNo) {
		int trashNo = 0;
		int result = session.insert("trashMapper.writeTrashPost", tp);
		if(result > 0) {
			TrashPost trashPost = session.selectOne("trashMapper.getTrashPostNo",tp);
			int trashPostNo = trashPost.getTrashPostNo();
			
			Map<String, Object> param = new HashMap<>();
			param.put("subCategoryNo", tsc.getSubCategoryNo());
			param.put("trashPostNo", trashPostNo);
			param.put("userNo", userNo);
			result = session.insert("trashMapper.writeTrash", param);
			if(result > 0) {
				Trash trash = session.selectOne("trashMapper.getTrashNo",trashPostNo);
				trashNo = trash.getTrashNo();
			}
		}
		return trashNo;
	}
}
