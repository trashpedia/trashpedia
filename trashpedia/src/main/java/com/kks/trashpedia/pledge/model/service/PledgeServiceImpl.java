package com.kks.trashpedia.pledge.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.pledge.model.dao.PledgeDao;

@Service
public class PledgeServiceImpl implements PledgeService{
	
	@Autowired
	private PledgeDao dao;

	//게시글 보기
	@Override
	public List<Post> pledgeList(int subCategoryNo) {
		return dao.pledgeList(subCategoryNo);
	}

	//게시글 상세보기
	@Override
	public Post pledgeDetail(int postNo) {
		return dao.pledgeDetail(postNo);
	}

	// 처음 조회일 조회
	@Override
	public List<Date> pledgeHitDate(Board b) {
		return dao.pledgeHitDate(b);
	}
	//게시글 조회수 증가
	@Override
	public int increaseCount(Board b) {
		return dao.increaseCount(b);
	}



	
}
