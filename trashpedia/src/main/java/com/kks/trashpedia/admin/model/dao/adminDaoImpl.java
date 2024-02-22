package com.kks.trashpedia.admin.model.dao;

import java.sql.ResultSet;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.member.model.vo.Member;

@Repository
public class adminDaoImpl implements adminDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int allMember() {
		return session.selectOne("adminMapper.allMember");
	}

	@Override
	public int allBoard() {
		return session.selectOne("adminMapper.allBoard");
	}

	@Override
	public int newMember() {
		return session.selectOne("adminMapper.newMember");
	}

	@Override
	public int oldMember() {
		return session.selectOne("adminMapper.oldMember");
	}

	@Override
	public List<Member> getMemberData() {
		return session.selectList("adminMapper.getMemberData");
	}

	@Override
	public ResultSet getBoardData() {
		return null;
	}

	@Override
	public int countAllMember() {
		return session.selectOne("adminMapper.getCountAllMember");
	}

	@Override
	public Page<Member> getMember(Pageable pageable) {
		List<Member> members = session.selectList("adminMapper.getMember", null, new RowBounds((int) pageable.getOffset(), pageable.getPageSize()));
        int totalCount = session.selectOne("adminMapper.getCountAllMember");
        return new PageImpl<>(members, pageable, totalCount);
	}

	@Override
	public Member getMemberDetail(int userNo) {
		return session.selectOne("adminMapper.getMemberDetail",userNo);
	}

	@Override
	public Member mmDetailMember(int userNo) {
		return session.selectOne("adminMapper.getMemberDetail",userNo);
	}

	@Override
	public List<Board> mmDetailBoard(int userNo) {
		return session.selectList("adminMapper.getBoardList",userNo);
	}

	@Override
	public int countBoard(int userNo) {
		return session.selectOne("adminMapper.countBoard",userNo);
	}

	@Override
	public int countComment(int userNo) {
		return session.selectOne("adminMapper.countComment",userNo);
	}

	@Override
	public Page<Board> getBoardList(Pageable pageable, int userNo) {
		List<Board> members = session.selectList("adminMapper.getBoardList", userNo, new RowBounds((int) pageable.getOffset(), pageable.getPageSize()));
        int totalCount = session.selectOne("adminMapper.countBoard", userNo);
        return new PageImpl<>(members, pageable, totalCount);
	}

	@Override
	public Board getBoardDetail(int boardNo) {
		return session.selectOne("adminMapper.getBoardDetail",boardNo);
	}
	
}
