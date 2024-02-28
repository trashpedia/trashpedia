package com.kks.trashpedia.board.model.dao;

import java.sql.Date;
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

import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.trash.model.vo.Trash;

@Repository
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Post boardDetail(int postNo) {
		return session.selectOne("boardMapper.boardDetail", postNo);
	}

	@Override
	public Page<Board> boardList(int subCategoryNo, Pageable pageable, int page, String filter, String searchSelect, String searchValue) {
		Map<String, Object> param = new HashMap<>();
		param.put("filter", filter);
		param.put("searchSelect", searchSelect);
		param.put("searchValue", searchValue);
		List<Board> pages = session.selectList("boardMapper.boardList",param, new RowBounds(page, pageable.getPageSize()));
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
			public List<Trash> getFreeTrashList() {
		        try {
		            return session.selectList("boardMapper.getFreeTrashList");
		        } catch (MyBatisSystemException e) {
		            // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
		            e.printStackTrace();
		            return null;// 또는 null 등 적절한 값으로 처리
		        }
			}

			@Override
			public String getImageUrlByTrashNo(int trashNo) {
			    try {
			        return session.selectOne("boardMapper.getImageUrlByTrashNo", trashNo);
			    } catch (MyBatisSystemException e) {
			        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			        e.printStackTrace();
			        return null; // 또는 적절한 오류 처리
			    }
			}

			@Override
			public String getTrashTitleByTrashNo(int trashNo) {
			    try {
			        return session.selectOne("boardMapper.getTrashTitleByTrashNo()", trashNo);
			    } catch (MyBatisSystemException e) {
			        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			        e.printStackTrace();
			        return null; // 또는 적절한 오류 처리
			    }
			}

			@Override
			public String getTrashContentByTrashNo(int trashNo) {
			    try {
			        return session.selectOne("boardMapper.getTrashContentByTrashNo", trashNo);
			    } catch (MyBatisSystemException e) {
			        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			        e.printStackTrace();
			        return null; // 또는 적절한 오류 처리
			    }
			}
			
			
			// 무료 상세 페이지

			@Override
			public Trash getFreeTrashDetail(int trashNo) {
			    try {
			        return session.selectOne("boardMapper.getFreeTrashDetail", trashNo);
			    } catch (MyBatisSystemException e) {
			        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			        e.printStackTrace();
			        return null; // 또는 적절한 오류 처리
			    }
			}

			@Override
			public String getTrashWriterByTrashNo(int trashNo) {
			    try {
			        return session.selectOne("boardMapper.getTrashWriterByTrashNo", trashNo);
			    } catch (MyBatisSystemException e) {
			        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			        e.printStackTrace();
			        return null; // 또는 적절한 오류 처리
			    }
			}

			@Override
			public String getTrashCreateByTrashNo(int trashNo) {
			    try {
			        return session.selectOne("boardMapper.getTrashCreateByTrashNo", trashNo);
			    } catch (MyBatisSystemException e) {
			        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환getTrashViewsByTrashNo
			        e.printStackTrace();
			        return null; // 또는 적절한 오류 처리
			    }
			}

			@Override
			public Date getTrashViewsByTrashNo(int trashNo) {
			    try {
			        return session.selectOne("boardMapper.getTrashViewsByTrashNo", trashNo);
			    } catch (MyBatisSystemException e) {
			        // 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			        e.printStackTrace();
			        return null; // 또는 적절한 오류 처리
			    }
			}
	
	
	
}
