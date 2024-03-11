package com.kks.trashpedia.trash.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kks.trashpedia.trash.model.dao.TrashDao;
import com.kks.trashpedia.trash.model.vo.Request;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
import com.kks.trashpedia.trash.model.vo.TrashHits;
import com.kks.trashpedia.trash.model.vo.TrashPost;
import com.kks.trashpedia.trash.model.vo.TrashSubCategory;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrashServiceImpl implements TrashService{

	private final TrashDao dao;

	//최근 업데이트된 쓰레기
	@Override
	public List<TrashPost> getRecentlyTrashList() {
		return dao.getRecentlyTrashList();
	}

	@Override
	public List<TrashPost> getPopularList() {
		return dao.getPopularList();
	}

	@Override
	public Trash trashDetail(int trashNo) {
		return dao.trashDetail(trashNo);
	}


	@Override
	public List<TrashPost> getSimilarList(int trashNo) {
		return dao.getSimilarList(trashNo);
	}

	@Override
	public List<TrashBigCategory> getAllBigCategoryList() {
		return dao.getAllBigCategoryList();
	}

	@Override
	public List<TrashSubCategory> getAllSubCategoryList() {
		return dao.getAllSubCategoryList();
	}

	@Override
	public List<Trash> getAllTrashList() {
		return dao.getAllTrashList();
	}

	@Override
	public List<TrashSubCategory> getSubCategoryList(int bigCategoryNo) {
		return dao.getSubCategoryList(bigCategoryNo);
	}

	@Override
	public int writeTrash(TrashPost tp, TrashSubCategory tsc, int userNo) {
		return dao.writeTrash(tp, tsc, userNo);
	}
	
	@Override
	public int deleteTrash(int trashNo) {
		return dao.deleteTrash(trashNo);
	}

	@Override
	public int undeleteTrash(int trashNo) {
		return dao.undeleteTrash(trashNo);
	}

	@Override
	public int updateTrashPost(Trash trash, TrashPost trashPost) {
		return dao.updateTrash(trash, trashPost);
	}

	@Override
	public int writeRequest(Request r) {
		return dao.writeRequest(r);
	}

	@Override
	public Request getRequest(int requestNo) {
		return dao.getRequest(requestNo);
	}

	@Override
	public int processingRequest(Request request) {
		return dao.processingRequest(request);
	}

	@Override
	public void upCount(TrashHits trashHits) {
		dao.upCount(trashHits);
	}
}
