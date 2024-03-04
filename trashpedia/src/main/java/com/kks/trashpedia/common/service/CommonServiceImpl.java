package com.kks.trashpedia.common.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.common.FileStore;
import com.kks.trashpedia.common.model.dao.CommonDao;
import com.kks.trashpedia.pledge.model.service.PledgeServiceImpl;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonDao dao;
	
	@Autowired
	private FileStore fileStore;
	
	@Autowired
	private PledgeServiceImpl pService;
	
	//카테고리 가지고오기
	@Override
	public SubCategory getSubCategory(SubCategory subcategory) {
		return  dao.getSubCategory(subcategory);
	}

	//게시글 등록(post)
	@Override
	public int createPost(Post p) {
		dao.createPost(p);
		return p.getPostNo();
	}

	//게시글 등록(Board)
	@Override
	public int createBoard(Board b) {
		dao.createBoard(b);
		return b.getBoardNo();
	}
	
	//파일&이미지 등록
	@Override
	public int insertFiles(Attachment attachment, ImgAttachment image) {
		
		int result1 = 1;
		int result2 = 1;
		
		if(attachment != null) {
			result1 = dao.insertAttachment(attachment);
		}
		if(image != null) {
			result2 = dao.insertImgAttachment(image);
		}
				
		return result1*result2;
	}

	// 게시글 수정페이지 이동
	@Override
	public Post getPost(int postNo) {
		return dao.getPost(postNo);
	}


	//첨부파일 삭제
	@Override
	public int deleteAttach(Post p) {
		return dao.deleteAttach(p);
	}
	
	//이미지삭제
	@Override
	public int deleteImage(Post p) {
		return dao.deleteImage(p);
	}


	// 게시글 수정
	@Transactional(rollbackFor= {Exception.class})
	@Override
	public int updatePost(Post p, String deleteImg, String deleteFile, 
			MultipartFile upfile, MultipartFile thumbnailImage, int type) throws IOException {
		
		//게시글 업데이트
		int result = dao.updatePost(p);
		
		Attachment attachment = fileStore.storeFile(upfile);
		ImgAttachment image = fileStore.storeImage(thumbnailImage);
		
		if(result>0) {
			// 첨부파일 처리
			if(!deleteFile.equals("")) {
				deleteAttach(p);
			}
			
			if(attachment != null){
				attachment.setRefBno(p.getPostNo());
				attachment.setFileType(type);
				dao.insertAttachment(attachment);
			}
		
			if(!deleteImg.equals("")) {				
				deleteImage(p);
			}
			//이미지 처리
			if(image != null){
				image.setRefBno(p.getPostNo());
				image.setImgType(type);
				dao.insertImgAttachment(image);
			}
			
		}
		return result;
	}

	
	
	
}
