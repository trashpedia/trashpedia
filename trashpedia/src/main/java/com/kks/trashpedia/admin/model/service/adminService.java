package com.kks.trashpedia.admin.model.service;

import java.util.List;
import java.util.Map;

public interface adminService {

	int allMember();

	int allBoard();

	int newMember();

	int oldMember();

	List<Map<String, Object>> getMemberData();

	List<Map<String, Object>> getBoardData();

}
