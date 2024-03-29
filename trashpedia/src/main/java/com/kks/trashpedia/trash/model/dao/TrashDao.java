package com.kks.trashpedia.trash.model.dao;

import java.util.List;
import java.util.Map;

import com.kks.trashpedia.trash.model.vo.Request;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
import com.kks.trashpedia.trash.model.vo.TrashHits;
import com.kks.trashpedia.trash.model.vo.TrashPost;
import com.kks.trashpedia.trash.model.vo.TrashSubCategory;

public interface TrashDao {

	//최근 업데이트된 쓰레기
	List<TrashPost> getRecentlyTrashList();

	//인기 쓰레기
	List<TrashPost> getPopularList();

	//대분류, 소분류가 같은 쓰레기
	List<TrashPost> getSimilarList(int trashNo);
	
	//쓰레기 상세페이지
	Trash trashDetail(int trashNo);

	//대분류 리스트 가져오기
	List<TrashBigCategory> getAllBigCategoryList();

	//소분류 리스트 가져오기
	List<TrashSubCategory> getAllSubCategoryList();

	//쓰레기 모두 가져오기
	List<Trash> getAllTrashList(Map<String, Object> map);

	List<TrashSubCategory> getSubCategoryList(int bigCategoryNo);

	int writeTrash(TrashPost tp, TrashSubCategory tsc, int userNo);

	int deleteTrash(int trashNo);

	int undeleteTrash(int trashNo);

	int updateTrash(Trash trash, TrashPost trashPost);

	int writeRequest(Request r);

	Request getRequest(int requestNo);

	int processingRequest(Request request);

	void upCount(TrashHits trashHits);
}