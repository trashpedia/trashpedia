package com.kks.trashpedia.encyclopedia.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.encyclopedia.model.dao.EncyclopediaDao;
import com.kks.trashpedia.trash.model.vo.Trash;


@Service
public class EncyclopediaServiceImpl implements EncyclopediaService{
	
	@Autowired
	private EncyclopediaDao encDao;
	

	// Default 아무거나 가져옴
    @Override
    public List<Trash> getAllTrashList() {
        return encDao.getAllTrashList();
    }
    
    // 검색 기능
    @Override
    public int searchTrash(String searchText) {
    	return encDao.searchTrash(searchText);
    }
    
    //카테고리 선택시
    @Override
    public List<Trash> getTrashListByCategory(String category) {
        return encDao.getTrashListByCategory(category);
    }

    // Trash정보가져오기
	@Override
	public Trash getTrashByNo(int trashNo) {
		// TODO Auto-generated method stub
		return encDao.getTrashByNo(trashNo);
	}
	// Trash 이미지 가져오기
	@Override
	public String getImageUrlByTrashNo(int trashNo) {
		// TODO Auto-generated method stub
		return encDao.getImageUrlByTrashNo(trashNo);
	}

	@Override
	public String getTrashContentByTrashNo(int trashNo) {
		// TODO Auto-generated method stub
		return encDao.getTrashContentByTrashNo(trashNo);
	}

	@Override
	public List<Trash> getPopularTrashList() {
		// TODO Auto-generated method stub
		return encDao.getPopularTrashList();
	}

	@Override
	public String getTrashTitleByTrashNo(int trashNo) {
		// TODO Auto-generated method stub
		return encDao.getTrashTitleByTrashNo(trashNo);
	}

	

}
