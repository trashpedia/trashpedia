package com.kks.trashpedia.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Post;
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

	@Override
	public int idCheck(String userEmail) {
		return dao.idCheck(userEmail);
	}

	// 마이페이지 
	// 게시글
	@Override
	public List<Post> pledgeList(String userEmail) {
		return dao.pledgeList(userEmail);
	}

	// 댓글
	@Override
	public List<Comment> commentList(String userEmail) {
		return dao.commentList(userEmail);
	}
}