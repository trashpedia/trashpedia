package com.kks.trashpedia.common.service;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

public interface CommonService {

	SubCategory getSubCategory(SubCategory subcategory);

	int createPost(Post p);

	int createBoard(Board b);

}
