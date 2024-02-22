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
	

    @Override
    public List<Trash> getAllTrashList() {
        return encDao.getAllTrashList();
    }

    @Override
    public List<Trash> getTrashListByCategory(String category) {
        return encDao.getTrashListByCategory(category);
    }

	@Override
	public Trash getTrashByNo(int trashNo) {
		// TODO Auto-generated method stub
		return encDao.getTrashByNo(trashNo);
	}
	

}
