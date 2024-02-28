package com.kks.trashpedia.encyclopedia.model.dao;

import java.util.List;

import com.kks.trashpedia.trash.model.vo.Trash;

public interface EncyclopediaDao {


	List<Trash> getAllTrashList();

	List<Trash> getTrashListByCategory(String category);

	Trash getTrashByNo(int trashNo);

	String getImageUrlByTrashNo(int trashNo);

	String getTrashContentByTrashNo(int trashNo);

	List<Trash> getPopularTrashList();

	String getTrashTitleByTrashNo(int trashNo);

	int searchTrash(String searchText);



}
