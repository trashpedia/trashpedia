package com.kks.trashpedia.pledge.model.dao;

import java.sql.Date;
import java.util.List;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;

public interface PledgeDao {

	//게시글 리스트 조회
	List<Post> pledgeList(int subCategoryNo);

	//게시글 상세보기
	Post pledgeDetail(int postNo);

	//처음 조회일 조회
	List<Date> pledgeHitDate(Board b);
	
	//게시글 조회수 증가	
	int increaseCount(Board b);



}
