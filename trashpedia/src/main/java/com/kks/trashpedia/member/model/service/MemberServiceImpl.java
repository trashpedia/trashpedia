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

	@Override
	public Member loginMember(Member m) {
		return dao.loginMember(m);
	}

	@Override
	public int updateMember(Member m) {
		return dao.updateMember(m);
	}

	@Override
	public int deleteMember(Member m) {
		return dao.deleteMember(m);
		
	}



	
}
