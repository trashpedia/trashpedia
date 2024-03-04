package com.kks.trashpedia.member.model.dao;

import com.kks.trashpedia.member.model.vo.Member;

public interface MemberDao {

	int emailCheck(String userEmail);

	int joinMember(Member m);

	Member loginMember(Member m);

	int updateMember(Member m);

	int deleteMember(Member m);


	


}
