package com.kks.trashpedia.trash.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.trash.model.dao.TrashDao;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
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
	public List<TrashBigCategory> getBigCategoryList() {
		return dao.getBigCategoryList();
	}

	@Override
	public List<TrashSubCategory> getSubCategoryList() {
		return dao.getSubCategoryList();
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
	public int writeTrash(TrashPost tp, TrashSubCategory tsc) {
		return dao.writeTrash(tp, tsc);
	}


	
	
}
