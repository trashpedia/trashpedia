package com.kks.trashpedia.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.member.model.dao.MemberDao;
import com.kks.trashpedia.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao dao;

	@Override
	public int joinMember(Member m) {
		return dao.joinMember(m);
	}

	
}
