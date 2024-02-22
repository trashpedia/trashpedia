package com.kks.trashpedia.encyclopedia.model.dao;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.MyBatisSystemException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.trash.model.vo.Trash;


@Repository
public class EncyclopediaDaoImpl implements EncyclopediaDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
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
}
