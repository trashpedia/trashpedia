package com.kks.trashpedia.trash.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.trash.model.vo.Request;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
import com.kks.trashpedia.trash.model.vo.TrashHits;
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
	public List<TrashBigCategory> getAllBigCategoryList() {
		return session.selectList("trashMapper.getAllBigCategoryList");
	}

	@Override
	public List<TrashSubCategory> getAllSubCategoryList() {
		return session.selectList("trashMapper.getAllSubCategoryList");
	}

	@Override
	public List<Trash> getAllTrashList() {
		return session.selectList("trashMapper.getAllTrashList");
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

	@Override
	public int deleteTrash(int trashNo) {
		Trash trash = session.selectOne("trashMapper.trashDetail",trashNo);
		int trashPostNo = trash.getTrashPostNo();
		return session.update("trashMapper.deleteTrash",trashPostNo);
	}

	@Override
	public int undeleteTrash(int trashNo) {
		Trash trash = session.selectOne("trashMapper.trashDetail",trashNo);
		int trashPostNo = trash.getTrashPostNo();
		return session.update("trashMapper.undeleteTrash",trashPostNo);
	}

	@Override
	public int updateTrash(Trash trash, TrashPost trashPost) {
		Trash getTrash = session.selectOne("trashMapper.getTrash", trash);
		trash.setTrashPostNo(getTrash.getTrashPostNo());
		int trashPostNo = getTrash.getTrashPostNo();
		int result = session.update("trashMapper.updateTrash", trash);
		if(result > 0) {
			TrashPost gtp = session.selectOne("trashMapper.getTrashPost", trashPostNo);
			trashPost.setTrashPostNo(gtp.getTrashPostNo());
			trashPost.setCreateDate(gtp.getCreateDate());
			trashPost.setStatus(gtp.getStatus());
			result = session.update("trashMapper.updateTrashPost", trashPost);
		}
		return result;
	}

	@Override
	public int writeRequest(Request r) {
		return session.insert("trashMapper.writeRequest",r);
	}

	@Override
	public Request getRequest(int requestNo) {
		return session.selectOne("trashMapper.getRequest",requestNo);
	}

	@Override
	public int processingRequest(Request request) {
		return session.update("trashMapper.processingRequest", request);
	}

	@Override
	public void upCount(TrashHits trashHits) {
		List<TrashHits> list = session.selectList("trashMapper.getHits", trashHits);
		if(list.size() == 0) {
			session.insert("trashMapper.upCount",trashHits);
		}
	}
}
