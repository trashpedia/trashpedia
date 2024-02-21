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
		List<Object[]> data = new ArrayList<>();
//		ResultSet rs = dao.getMemberData();
//		Object[] row = new Object[3];
//        row[0] = rs.getString("일");
//        row[1] = rs.getInt("가입자");
//        row[2] = rs.getInt("탈퇴자");
//        data.add(row);
		return null;
	}

	@Override
	public List<Map<String, Object>> getBoardData() {
		List<Object[]> data = new ArrayList<>();
//		ResultSet rs = dao.getBoardData();
//		Object[] row = new Object[3];
//        row[0] = rs.getString("day");
//        row[1] = rs.getInt("new_member");
//        row[2] = rs.getInt("deleted_member");
//        data.add(row);
		return null;
	}
	
	
}
