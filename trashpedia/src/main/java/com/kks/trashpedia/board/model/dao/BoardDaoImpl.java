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
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.NestedComment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;


@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Post boardDetail(int postNo) {
		return session.selectOne("boardMapper.boardDetail", postNo);
	}

	@Override
	public Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect,
			String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("filter", filter);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		param.put("subCategoryNo", subCategoryNo);
		List<Board> pages = session.selectList("boardMapper.boardList", param,
				new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()));
		int totalCount = session.selectOne("boardMapper.boardCount", param);
		return new PageImpl<>(pages, pageable, totalCount);
	}
	
	

	

	@Override
	public List<BigCategory> bigCategory() {
		return session.selectList("boardMapper.bigCategory");
	}

	@Override
	public List<SubCategory> subCategory() {
		return session.selectList("boardMapper.subCategory");
	}

	@Override
	public List<Post> categoryList() {
		return session.selectList("boardMapper.categoryList");
	}
	
	
	
	
	
	
	
	
	// 무료 페이지
	@Override
	public List<Post> getFreeTrashList(int subCategoryNo) {
	    try {
	        return session.selectList("boardMapper.getFreeTrashList",subCategoryNo);
	    } catch (MyBatisSystemException e) {
	        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환 또는 기본값 반환
	        e.printStackTrace();
	        return Collections.emptyList(); // 빈 리스트 반환하거나 다른 기본값 반환
	    }
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
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}
	
	//게시글 상세-이미지
	@Override
	public ImgAttachment getImageUrlByboardNo(int boardNo) {
		try {
			return session.selectOne("boardMapper.getImageUrlByboardNo", boardNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}
	
	//게시글 상세-첨부파일
	@Override
	public Attachment getDetailAttach(int boardNo) {
		return  session.selectOne("boardMapper.getDetailAttach", boardNo);
	}

	@Override
	public String getTrashTitleByboardNo(int boardNo) {
		try {
			return session.selectOne("boardMapper.getTrashTitleByboardNo()", boardNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}

	@Override
	public String getTrashContentByboardNo(int boardNo) {
		try {
			return session.selectOne("boardMapper.getTrashContentByboardNo", boardNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}

	
	
	
	
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
	//처음 조회일 조회
	@Override
	public Date pledgeHitDate(Board b) {
		return session.selectOne("boardMapper.getHitDate", b);
	}
	
	//게시글 조회수 증가
	@Override
	public int increaseCount(Board b) {
		return session.update("boardMapper.increaseCount", b);
	}

	@Override
	public Page<Post> loadListData(Pageable pageable, int page, String sort, String searchSelect, String searchValue,
			int subCategoryNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("sort", sort);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		param.put("subCategoryNo", subCategoryNo);
		List<Post> posts = session.selectList("pledgeMapper.pledgeListData",param,new RowBounds(page*pageable.getPageSize(), pageable.getPageSize()) );
		int totalCount = session.selectOne("pledgeMapper.postListCount",param);
		
		return new PageImpl<>(posts, pageable, totalCount);
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


	

}
