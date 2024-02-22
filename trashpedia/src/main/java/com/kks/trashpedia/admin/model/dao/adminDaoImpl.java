package com.kks.trashpedia.admin.model.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.NestedComment;
import com.kks.trashpedia.member.model.vo.Member;

@Repository
public class adminDaoImpl implements adminDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int allMemberCount() {
		return session.selectOne("adminMapper.allMemberCount");
	}

	@Override
	public int allBoardCount() {
		return session.selectOne("adminMapper.allBoardCount");
	}

	@Override
	public int newMemberCount() {
		return session.selectOne("adminMapper.newMemberCount");
	}

	@Override
	public int oldMemberCount() {
		return session.selectOne("adminMapper.oldMemberCount");
	}

	@Override
	public List<Member> getMemberChartsData() {
		return session.selectList("adminMapper.getMemberChartsData");
	}
	
	@Override
	public List<Board> getBoardChartsData() {
		return session.selectList("adminMapper.getBoardChartsData");
	}

	@Override
	public List<Comment> getCommentChartsData() {
	    List<Comment> comments = session.selectList("adminMapper.getCommentChartsData");
	    List<NestedComment> nestedComments = session.selectList("adminMapper.getNCChartsData");

	    List<Comment> mergedList = new ArrayList<>();
	    for (int i = 0; i < comments.size(); i++) {
	        Comment comment = comments.get(i);
	        NestedComment nestedComment = nestedComments.get(i);
	        
	        int totalCount = comment.getCountComment() + nestedComment.getCountNestedComment();
	        comment.setCountComment(totalCount);
	        
	        mergedList.add(comment);
	    }
	    return mergedList;
	}
	
	@Override
	public ResultSet getBoardData() {
		return null;
	}

	@Override
	public int countAllMember() {
		return session.selectOne("adminMapper.getCountAllMember");
	}

	@Override
	public Page<Member> getMemberList(Pageable pageable) {
		List<Member> members = session.selectList("adminMapper.getMemberList", null, new RowBounds((int) pageable.getOffset(), pageable.getPageSize()));
        int totalCount = session.selectOne("adminMapper.getCountAllMember");
        return new PageImpl<>(members, pageable, totalCount);
	}

	@Override
	public Member getMemberListDetail(int userNo) {
		return session.selectOne("adminMapper.getMemberDetail",userNo);
	}

	@Override
	public Member getMemberDetail(int userNo) {
		return session.selectOne("adminMapper.getMemberDetail",userNo);
	}

	@Override
	public List<Board> mmDetailBoard(int userNo) {
		return session.selectList("adminMapper.getBoardList",userNo);
	}

	@Override
	public int memberCountBoard(int userNo) {
		return session.selectOne("adminMapper.memberCountBoard",userNo);
	}

	@Override
	public int memberCountComment(int userNo) {
		return session.selectOne("adminMapper.memberCountComment",userNo);
	}

	@Override
	public Page<Board> getMemberBoardList(Pageable pageable, int userNo) {
		List<Board> members = session.selectList("adminMapper.getMemberBoardList", userNo, new RowBounds((int) pageable.getOffset(), pageable.getPageSize()));
        int totalCount = session.selectOne("adminMapper.memberCountBoard", userNo);
        return new PageImpl<>(members, pageable, totalCount);
	}

	@Override
	public Board getMemberBoardDetail(int boardNo) {
		return session.selectOne("adminMapper.getMemberBoardDetail",boardNo);
	}

	@Override
	public Page<Board> getMemberCommentList(Pageable pageable, int userNo) {
		List<Board> comments = session.selectList("adminMapper.getMemberCommentList", userNo, new RowBounds((int)pageable.getOffset(),pageable.getPageSize()));
		int totalCount = session.selectOne("adminMapper.memberCountComment", userNo);
		return new PageImpl<>(comments, pageable, totalCount);
	}


	
}
