package com.kks.trashpedia.encyclopedia.model.dao;

import java.util.List;

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
        return sqlSession.selectList("trashMapper.getAllTrashList");
    }

    @Override
    public List<Trash> getTrashListByCategory(String category) {
        return sqlSession.selectList("trashMapper.getTrashListByCategory", category);
    }
}
