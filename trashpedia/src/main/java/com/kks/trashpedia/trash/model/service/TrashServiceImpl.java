package com.kks.trashpedia.trash.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.trash.model.dao.TrashDao;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashPost;

@Service
public class TrashServiceImpl implements TrashService{
	@Autowired
	private TrashDao dao;

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


	
	
}
