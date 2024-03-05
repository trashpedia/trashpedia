package com.kks.trashpedia.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class MemberDaoImpl implements MemberDao{

	private final SqlSessionTemplate session;

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
	public List<Post> pledgeList(int userNo) {
		return session.selectOne("memberMapper.pledgeList", userNo);
	}
	// 댓글
	@Override
	public List<Comment> commentList(int userNo) {
		return session.selectOne("memberMapper.commentList", userNo);
	}

	@Override
	public String findEmail(String userName, String phone) {
		Map<String, Object> param = new HashMap<>();
		param.put("userName", userName);
		param.put("phone", phone);
		Member m = session.selectOne("memberMapper.findEmail", param);
		if(m != null) {
			return m.getUserEmail();
		} else {
			return null;
		}
	}

	@Override
	public int checkEmail(String userEmail, String phone) {
		Map<String, Object> param = new HashMap<>();
		param.put("userEmail", userEmail);
		param.put("phone", phone);
		return session.selectOne("memberMapper.checkEmail", param);
	}
}
