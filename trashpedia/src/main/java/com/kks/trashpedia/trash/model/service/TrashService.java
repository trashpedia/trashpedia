package com.kks.trashpedia.trash.model.service;

import java.util.List;

import com.kks.trashpedia.trash.model.vo.TrashPost;

public interface TrashService {

	//최근 업데이트된 쓰레기
	List<TrashPost> getRecentlyTrashList();

	List<TrashPost> getPopularList();

}
