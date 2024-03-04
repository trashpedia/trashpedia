package com.kks.trashpedia.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int emailCheck(String userEmail) {
		return session.selectOne("memberMapper.emailCheck", userEmail);
	}

	@Override
	public int joinMember(Member m) {
		int result = session.insert("memberMapper.joinMember", m);
		return result;
	}

	@Override
	public Member loginMember(Member m) {
		return session.selectOne("memberMapper.loginMember", m);
	}

	@Override
	public int updateMember(Member m) {
		return session.update("memberMapper.updateMember", m);
	}

	@Override
	public int deleteMember(Member m) {
		return session.update("memberMapper.deleteMember", m);
	}

	@Override
	public int idCheck(String userEmail) {
		return session.selectOne("memberMapper.idCheck", userEmail);
	}

	// 마이페이지
	// 게시판
	@Override
	public List<Post> pledgeList(String userEmail) {
		return session.selectOne("memberMapper.pledgeList", userEmail);
	}
	// 댓글
	@Override
	public List<Comment> commentList(String userEmail) {
		return session.selectOne("memberMapper.commentList", userEmail);
	}
}
