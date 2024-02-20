package com.kks.trashpedia.trash.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TrashDaoImpl implements TrashDao{
	@Autowired
	private SqlSessionTemplate session;
	
	
}
