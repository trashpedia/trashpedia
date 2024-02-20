package com.kks.trashpedia.pledge.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.pledge.model.dao.PledgeDao;

@Service
public class PledgeServiceImpl implements PledgeService{
	@Autowired
	private PledgeDao dao;
	
	
}
