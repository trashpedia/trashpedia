package com.kks.trashpedia.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int joinMember(Member m) {
		return session.insert("memberMapper.joinMember", m);
	}
}
