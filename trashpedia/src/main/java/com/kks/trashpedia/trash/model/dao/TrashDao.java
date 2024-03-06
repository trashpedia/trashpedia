package com.kks.trashpedia.trash.model.dao;

import java.util.List;

import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashPost;

public interface TrashDao {

	//최근 업데이트된 쓰레기
	List<TrashPost> getRecentlyTrashList();

	//인기 쓰레기
	List<TrashPost> getPopularList();

	//대분류, 소분류가 같은 쓰레기
	List<TrashPost> getSimilarList(int trashNo);
	
	//쓰레기 상세페이지
	Trash trashDetail(int trashNo);

	//

}
