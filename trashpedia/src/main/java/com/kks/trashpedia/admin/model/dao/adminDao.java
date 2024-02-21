package com.kks.trashpedia.admin.model.dao;

import java.sql.ResultSet;

public interface adminDao {

	int allMember();

	int allBoard();

	int newMember();

	int oldMember();

	ResultSet getMemberData();

	ResultSet getBoardData();

}
