package com.kks.trashpedia.admin.model.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.admin.model.dao.adminDao;

@Service
public class adminServiceImpl implements adminService{
	@Autowired
	private adminDao dao;

	@Override
	public int allMember() {
		return dao.allMember();
	}

	@Override
	public int allBoard() {
		return dao.allBoard();
	}

	@Override
	public int newMember() {
		return dao.newMember();
	}

	@Override
	public int oldMember() {
		return dao.oldMember();
	}

	@Override
	public List<Map<String, Object>> getMemberData() {
		return (List<Map<String, Object>>) dao.getMemberData();
	}

	@Override
	public List<?> getBoardData() {
		// TODO Auto-generated method stub
		return null;
	}

	
}
