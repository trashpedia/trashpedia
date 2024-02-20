package com.kks.trashpedia.trash.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.trash.model.dao.TrashDao;

@Service
public class TrashServiceImpl implements TrashService{
	@Autowired
	private TrashDao dao;
	
	
}
