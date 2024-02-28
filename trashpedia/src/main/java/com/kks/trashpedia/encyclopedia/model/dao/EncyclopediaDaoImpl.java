package com.kks.trashpedia.encyclopedia.model.dao;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.MyBatisSystemException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.trash.model.vo.Trash;

@Repository
public class EncyclopediaDaoImpl implements EncyclopediaDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 카테고리 없는 랜덤 정보제공
	@Override
	public List<Trash> getAllTrashList() {
		try {
			return sqlSession.selectList("trashMapper.getAllTrashList");
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return Collections.emptyList(); // 또는 null 등 적절한 값으로 처리
		}
	}

	// 검색기능
	@Override
	public int searchTrash(String searchText) {
		try {
			return sqlSession.selectOne("trashMapper.searchTrash", searchText);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<Trash> getTrashListByCategory(String category) {
		try {
			return sqlSession.selectList("trashMapper.getTrashListByCategory", category);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return Collections.emptyList(); // 또는 null 등 적절한 값으로 처리
		}
	}

	// Trash정보 가져오기
	@Override
	public Trash getTrashByNo(int trashNo) {
		try {
			return sqlSession.selectOne("trashMapper.getTrashByNo", trashNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}

	// 이미지
	@Override
	public String getImageUrlByTrashNo(int trashNo) {
		try {
			return sqlSession.selectOne("trashMapper.getImageUrlByTrashNo", trashNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}

	// Trash내용
	@Override
	public String getTrashContentByTrashNo(int trashNo) {
		try {
			return sqlSession.selectOne("trashMapper.getTrashContentByTrashNo", trashNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}

	// 오늘의 인기 Trash
	@Override
	public List<Trash> getPopularTrashList() {
		try {
			return sqlSession.selectList("trashMapper.getPopularTrashList");
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return Collections.emptyList(); // 또는 적절한 오류 처리
		}
	}

	// Trash이름
	@Override
	public String getTrashTitleByTrashNo(int trashNo) {
		try {
			return sqlSession.selectOne("trashMapper.getTrashTitleByTrashNo()", trashNo);
		} catch (MyBatisSystemException e) {
			// 예외 처리: 로깅하고 사용자에게 오류 메시지 반환
			e.printStackTrace();
			return null; // 또는 적절한 오류 처리
		}
	}

}
