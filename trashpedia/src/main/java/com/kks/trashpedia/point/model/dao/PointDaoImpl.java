package com.kks.trashpedia.point.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDaoImpl implements PointDao{
	@Autowired
	private SqlSessionTemplate session;
	
	
}
