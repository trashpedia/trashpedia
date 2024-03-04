package com.kks.trashpedia.member.model.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.member.model.dao.MemberDao;
import com.kks.trashpedia.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private MemberDao dao;

	@Value("${api.key}")
	private String apiKey;
	
	@Value("${api.secret}")
	private String apiSecret;

	@Override
	public int emailCheck(String userEmail) {
		return dao.emailCheck(userEmail);
	}

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
