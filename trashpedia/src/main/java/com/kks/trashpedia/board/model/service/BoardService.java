package com.kks.trashpedia.board.model.service;

import java.util.List;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;

public interface BoardService {

	List<Post> boardList(int subCategoryNo);

	Board boardDetail(int postNo);

}
