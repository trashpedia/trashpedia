package com.kks.trashpedia.trash.model.dao;

import java.util.List;

import com.kks.trashpedia.trash.model.vo.TrashPost;

public interface TrashDao {

	//최근 업데이트된 쓰레기
	List<TrashPost> getRecentlyTrashList();

	List<TrashPost> getPopularList();

	TrashPost trashDetail(int trashPostNo);

}
