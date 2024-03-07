package com.kks.trashpedia.pledge.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.pledge.model.vo.Signature;
import com.kks.trashpedia.report.model.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class PledgeDaoImpl implements PledgeDao{
	
	@Autowired
	private SqlSessionTemplate session;

	//실천서약 게시글 조회
	@Override
	public List<Post> pledgeList(int subCategoryNo) {
		return session.selectList("pledgeMapper.pledgeList",subCategoryNo);
	}

	//게시글 상세 조회
	@Override
	public Post pledgeDetail(int postNo) {
		return session.selectOne("pledgeMapper.pledgeDetail", postNo);
	}
	
	//게시글 상세-이미지
	@Override
	public ImgAttachment pledgeDetailImg(int boardNo) {
		return session.selectOne("pledgeMapper.pledgeDetailImg", boardNo);
	}
	
	//게시글 상세-첨부파일
	@Override
	public Attachment pledgeDetailAttach(int boardNo) {
		return  session.selectOne("pledgeMapper.pledgeDetailAttach", boardNo);
	}
	
	//처음 조회일 조회
	@Override
	public Date pledgeHitDate(Board b) {
		return session.selectOne("pledgeMapper.pledgeHitDate", b);
	}
	
	//게시글 조회수 증가
	@Override
	public int increaseCount(Board b) {
		return session.update("pledgeMapper.increaseCount", b);
	}

	//게시글 삭제
	@Override
	public int pledgeDeletePost(Post p) {
		return session.update("pledgeMapper.pledgeDeletePost",p);
	}
	@Override
	public int pledgeDeleteBoard(Post p) {
		return session.update("pledgeMapper.pledgeDeleteBoard",p);
	}

	//카테고리 정보 가져오기
	@Override
	public SubCategory getCategoryNo(Post p) {
		return session.selectOne("pledgeMapper.getCategoryNo",p);
	}

	//댓글조회
	@Override
	public List<Comment> selectCommentList(Board b) {
		return session.selectList("pledgeMapper.selectCommentList",b);
	}

	//댓글등록
	@Override
	public int insertComment(Comment c) {
		return session.insert("pledgeMapper.insertComment",c);
	}

	//댓글수정
	@Override
	public int updateComment(Comment comment) {
		return session.update("pledgeMapper.updateComment",comment);
	}

	//댓글삭제
	@Override
	public int deleteComment(Comment comment) {
		return session.update("pledgeMapper.deleteComment",comment);
	}
	
	//게시글조회-페이징,검색
	@Override
	public Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue, int subCategoryNo) {
	
		Map<String, Object> param = new HashMap<>();
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		param.put("subCategoryNo", subCategoryNo);
		List<Post> posts = session.selectList("pledgeMapper.pledgeListData",param,new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()) );
		int totalCount = session.selectOne("pledgeMapper.postListCount",param);
		
		return new PageImpl<>(posts, pageable, totalCount);
	
	}

	//실천서약 등록
	@Override
	public int insertSignature(Signature signature,  Member signatureMember) {
		
		//멤버 정보 조회
		Member member = session.selectOne("memberMapper.getMember", signatureMember);
		
		String signatureMemberPhone = signatureMember.getPhone().replaceAll("-", "");
		String memberPhone = member.getPhone().replaceAll("-", "");

		//입력정보와 멤버정보 비교
		if (signatureMember.getUserName().equals(member.getUserName()) && signatureMemberPhone.equals(memberPhone)) {
		    return session.insert("pledgeMapper.insertSignature", signature);
		} else {
		    return 2;
		}
	}

}
