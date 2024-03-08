package com.kks.trashpedia.trash.model.service;

import java.util.List;

import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
import com.kks.trashpedia.trash.model.vo.TrashPost;
import com.kks.trashpedia.trash.model.vo.TrashSubCategory;

public interface TrashService {

	//최근 업데이트된 쓰레기
	List<TrashPost> getRecentlyTrashList();

	//인기 쓰레기
	List<TrashPost> getPopularList();

	//상세페이지 쓰레기
	Trash trashDetail(int trashNo);

	//비슷한 카테고리의 쓰레기
	List<TrashPost> getSimilarList(int trashNo);

	//대분류
	List<TrashBigCategory> getBigCategoryList();

	//소분류
	List<TrashSubCategory> getSubCategoryList();

	//쓰레기 리스트
	List<Trash> getAllTrashList();

	List<TrashSubCategory> getSubCategoryList(int bigCategoryNo);

	int writeTrash(TrashPost tp, TrashSubCategory tsc, int userNo);

}
