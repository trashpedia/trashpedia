package com.kks.trashpedia.encyclopedia.model.service;
import java.util.List;

import com.kks.trashpedia.trash.model.vo.Trash;

public interface EncyclopediaService{

	List<Trash> getAllTrashList();

	List<Trash> getTrashListByCategory(String category);

	Trash getTrashByNo(int trashNo);



}
