package com.kks.trashpedia.member.model.service;

import com.kks.trashpedia.member.model.vo.Member;

public interface MemberService {
	
	int joinMember(Member m);

	Member loginMember(Member m);

	int updateMember(Member m);

	int deleteMember(Member m);

	
	
	
}
