package com.kks.trashpedia.pledge.model.service;

import java.sql.Date;
import java.util.List;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;

public interface PledgeService {

	//실천하기 게시글 조회
	List<Post> pledgeList(int subCategoryNo);

	//게시글 상세조회
	Post pledgeDetail(int postNo);
	
	//처음 조회일 조회
	Date pledgeHitDate(Board b);
	
	//게시글 조회수 증가
	int increaseCount(Board b);



}
