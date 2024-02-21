package com.kks.trashpedia.admin.model.dao;

import java.sql.ResultSet;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public ResultSet getMemberData() {
		return (ResultSet) session.selectList("adminMapper.getMemberData");
	}

	@Override
	public ResultSet getBoardData() {
		return null;
	}
	
	
}
