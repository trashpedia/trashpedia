package com.kks.trashpedia.common.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class CommonDaoImpl implements CommonDao{
	
	private final SqlSessionTemplate session;

	//카테고리 가지고오기
	@Override
	public SubCategory getSubCategory(SubCategory subcategory) {
		return session.selectOne("boardMapper.getSubCategory", subcategory);
	}

	//게시글등록(Post)
	@Override
	public int createPost(Post p) {
		return session.insert("boardMapper.createPost",p);
	}

	//게시글등록(Board)
	@Override
	public int createBoard(Board b) {
		return session.insert("boardMapper.createBoard",b);
	}

	//첨부파일등록
	@Override
	public int insertAttachment(Attachment attachment) {
		return session.insert("boardMapper.insertAttachment",attachment);
	}

	//이미지등록
	@Override
	public int insertImgAttachment(ImgAttachment image) {
		return session.insert("boardMapper.insertImgAttachment",image);
	}

	//게시글수정페이지 이동
	@Override
	public Post getPost(int postNo) {
		return session.selectOne("boardMapper.getPost", postNo);
	}

	//게시글 수정
	@Override
	public int updatePost(Post p) {
		return session.update("boardMapper.updatePost",p);
	}

	//첨부파일삭제
	@Override
	public int deleteAttach(Post p) {
		return session.update("boardMapper.deleteAttach",p);
	}

	//이미지삭제
	@Override
	public int deleteImage(Post p) {
		return session.delete("boardMapper.deleteImage",p);
	}

	//첨부파일삭제-파일리스트출력
	@Override
	public List<String> fileNameList() {
		return session.selectList("boardMapper.fileNameList");
	}

	//첨부파일삭제-이미지리스트출력
	@Override
	public List<String> imageNameList() {
		return session.selectList("boardMapper.imageNameList");
	}

	@Override
	public void deleteImage(int trashNo) {
		session.update("boardMapper.deleteImage2", trashNo);
	}
}
