package com.kks.trashpedia.encyclopedia.model.service;
import java.util.List;

import com.kks.trashpedia.trash.model.vo.Trash;

public interface EncyclopediaService{

	List<Trash> getAllTrashList();

	List<Trash> getTrashListByCategory(String category);

	Trash getTrashByNo(int trashNo);

    // 쓰레기 번호를 기반으로 이미지 주소 가져오기
    String getImageUrlByTrashNo(int trashNo);

    // 쓰레기 번호를 기반으로 쓰레기 내용 가져오기
    String getTrashContentByTrashNo(int trashNo);

	List<Trash> getPopularTrashList();

	String getTrashTitleByTrashNo(int trashNo);

}
