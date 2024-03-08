package com.kks.trashpedia.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.member.model.dao.MemberDao;
import com.kks.trashpedia.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberDao dao;

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
	public List<Board> pledgeList(int userNo) {
		return dao.pledgeList(userNo);
	}

	// 댓글
	@Override
	public List<Board> commentList(int userNo) {
		return dao.commentList(userNo);
	}

	@Override
	public String findEmail(String userName, String phone) {
		return dao.findEmail(userName, phone);
	}

	@Override
	public int checkEmail(String userEmail, String phone) {
		return dao.checkEmail(userEmail, phone);
	}

	@Override
	public int joinSocialMember(Member m, Long socialId, String socialType) {
		return dao.joinSocialMember(m, socialId, socialType);
	}

	@Override
	public Member getMember(int userNo) {
		return dao.getMember(userNo);
	}

}