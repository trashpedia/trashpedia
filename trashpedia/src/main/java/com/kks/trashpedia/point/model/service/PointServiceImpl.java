package com.kks.trashpedia.point.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.point.model.dao.PointDao;

@Service
public class PointServiceImpl implements PointService{
	@Autowired
	private PointDao dao;
	
	
}
