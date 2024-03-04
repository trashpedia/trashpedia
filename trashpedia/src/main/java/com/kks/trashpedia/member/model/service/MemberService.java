package com.kks.trashpedia.member.model.service;

import java.util.List;

import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.member.model.vo.Member;

public interface MemberService {
	
	int emailCheck(String userEmail);

	int joinMember(Member m);

	Member loginMember(Member m);

	int updateMember(Member m);

	int deleteMember(Member m);

	int idCheck(String userEmail);
	
	// 마이페이지 게시글	
	List<Post> pledgeList(String userEmail);
	// 댓글
	List<Comment> commentList(String userEmail);
}