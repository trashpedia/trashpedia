package com.kks.trashpedia.encyclopedia.model.dao;

import java.util.List;

import com.kks.trashpedia.trash.model.vo.Trash;

public interface EncyclopediaDao {


	List<Trash> getAllTrashList();

	List<Trash> getTrashListByCategory(String category);

	Trash getTrashByNo(int trashNo);



}
