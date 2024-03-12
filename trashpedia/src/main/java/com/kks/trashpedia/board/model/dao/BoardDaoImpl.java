package com.kks.trashpedia.board.model.dao;

import java.sql.Date;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.MyBatisSystemException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Hits;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.NestedComment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;


@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Board boardDetail(int boardNo) {
		return session.selectOne("boardMapper.boardDetail", boardNo);
	}

	@Override
	public Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect,
			String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("filter", filter);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		param.put("subCategoryNo", subCategoryNo);
		List<Board> pages = session.selectList("boardMapper.boardList", param, new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("boardMapper.boardCount", param);
		return new PageImpl<>(pages, pageable, totalCount);
	}

	@Override
	public List<BigCategory> allBigCategory() {
		return session.selectList("boardMapper.allBigCategory");
	}

	@Override
	public List<SubCategory> allSubCategory() {
		return session.selectList("boardMapper.allSubCategory");
	}

	@Override
	public List<Board> allBoardList() {
		return session.selectList("boardMapper.allBoardList");
	}
	
	@Override
	public SubCategory getSubCategoryNo(Post p) {
		return session.selectOne("boardMapper.getSubCategoryNo", p);
	}

	@Override
	public int deleteBoard(Post p) {
		Board b = session.selectOne("boardMapper.getBoard", p);
		int boardNo = b.getBoardNo();
		int postNo = p.getPostNo();
		int result = 0;
		result = session.update("boardMapper.deleteBoard", boardNo);
		if(result > 0) {
			result = session.update("boardMapper.deletePost", postNo);
		}
		return result;
	}
	
	@Override
	public ImgAttachment getImageUrl(int boardNo, int imgType) {
		Map<String, Object> param = new HashMap<>();
		param.put("boardNo", boardNo);
		param.put("imgType", imgType);
		return session.selectOne("boardMapper.getImageUrl", param);
	}
	
	@Override
	public Attachment getDetailAttach(int boardNo, int fileType) {
		Map<String, Object> param = new HashMap<>();
		param.put("boardNo", boardNo);
		param.put("imgType", fileType);
		return  session.selectOne("boardMapper.getDetailAttach", param);
	}
	
	
	
	
	
	
	// 무료 페이지
	@Override
	public List<Post> getFreeTrashList(int subCategoryNo, Pageable pageable, int page) {
	    int pageSize = pageable.getPageSize(); // 페이지당 항목 수
	    int pageNum = page; //  가져올 페이지 번호 

	    // 페이지 번호를 기반으로 startRow와 endRow 계산
	    int startRow = pageNum * pageSize;
	    int endRow = (pageNum + 1) * pageSize;

	    
	    try {
	        Map<String, Object> parameters = new HashMap<>();
	        parameters.put("subCategoryNo", subCategoryNo);
	        parameters.put("startRow", startRow);
	        parameters.put("endRow", endRow);
	        return session.selectList("boardMapper.getFreeTrashList", parameters);
	    } catch (MyBatisSystemException e) {
	        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환 또는 기본값 반환
	        e.printStackTrace();
	        return Collections.emptyList(); // 빈 리스트 반환하거나 다른 기본값 반환
	    }
	}
	
	@Override
	public List<Post> getFreeTrashTotalList(int subCategoryNo) {
		return session.selectList("boardMapper.getFreeTrashTotalList", subCategoryNo);
	}

	@Override
	public Post getPostByTitle(String title) {
		return session.selectOne("boardMapper.getPostByTitle",title);
	}

	// 무료 상세 조회
	@Override
	public Post getFreeTrashDetail(int postNo) {
		try {
			return session.selectOne("boardMapper.getFreeTrashDetail", postNo);
		} catch (MyBatisSystemException e) {
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}
	
	//게시글 상세-이미지
	

	// 무료 상세 페이지
	@Override
	public String getTrashWriterByboardNo(int boardNo) {
		try {
			return session.selectOne("boardMapper.getTrashWriterByboardNo", boardNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}
	
	

	@Override
	public String getTrashCreateByboardNo(int boardNo) {
		try {
			return session.selectOne("boardMapper.getTrashCreateByboardNo", boardNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환getTrashViewsByboardNo
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}

	@Override
	public Date getTrashViewsByboardNo(int boardNo) {
		try {
			return session.selectOne("boardMapper.getTrashViewsByboardNo", boardNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}
	
	//게시글 조회수 증가
	@Override
	public void increaseCount(Hits hits) {
		System.out.println(hits);
		List<Hits> list = session.selectList("boardMapper.getHitDate",hits);
		if(list.size() == 0) {
			session.update("boardMapper.increaseCount", hits);
		}
	}


	/*대댓글*/
	@Override
	public int insertNC(NestedComment nc) {
		return session.insert("boardMapper.insertNC", nc);
	}

	@Override
	public List<NestedComment> viewNC(int commentNo) {
		return session.selectList("boardMapper.viewNC", commentNo);
	}

	@Override
	public List<Comment> selectCommentList(Board b) {
		return session.selectList("boardMapper.viewNC", b);
	}

	@Override
	public int deleteNC(int nCommentNo) {
		return session.delete("boardMapper.deleteNC", nCommentNo);
	}

	// 댓글 작성시 포인트 증가
	@Override
	public int increaseUserPoint(int userNo, int amount, String pointContent) {
		   try {
		        Map<String, Object> param = new HashMap<>();
		        param.put("userNo", userNo);
		        param.put("amount", amount);
		        param.put("pointContent", pointContent);
		        return session.insert("boardMapper.increaseUserPoint", param);
		    } catch (MyBatisSystemException e) {
		        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환 또는 기본값 반환
		        e.printStackTrace();
		        return 0; 
		    }
	}

}