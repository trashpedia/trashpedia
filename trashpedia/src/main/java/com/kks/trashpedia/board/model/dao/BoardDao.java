package com.kks.trashpedia.board.model.dao;

import java.util.List;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;

public interface BoardDao {

	List<Post> boardList(int subCategoryNo);

	Board boardDetail(int postNo);
	

	

}
