package com.kks.trashpedia.common.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.common.FileStore;
import com.kks.trashpedia.common.service.CommonService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@RestController
public class CommonController {
	
	@Autowired
	private CommonService service;
	
	@Autowired
	private ServletContext application;	//application
	
	@Autowired
	private ResourceLoader resourceLoader;	//리소스 다운로드 객체
	
	@Autowired
	private FileStore fileStore;
	
	
	//카테고리 정보 가지고오기
	@GetMapping("/write")
	public ModelAndView getCategory(SubCategory subcategory) {
		
		ModelAndView mv = new ModelAndView();
		SubCategory category = service.getSubCategory(subcategory);
		mv.addObject("category",category);
		mv.setViewName("pledge/pledgeInsert");
		
		return mv;
	}
	
	//게시글 등록
	@PostMapping("/write/{bigCategoryNo}/{subCategoryNo}")
	public ModelAndView insertBoard(
			SubCategory subcategory, 
			Post p, 
			Board b,
			RedirectAttributes ra, 
			@RequestParam("thumbnail") MultipartFile thumbnailImage,
			@RequestParam("upfile") MultipartFile upfile,
			HttpServletRequest request
			) throws IOException {

		ModelAndView mv = new ModelAndView();
		
		// post 등록
		int postNo = service.createPost(p);

		b.setPostNo(postNo);
		b.setSubCategoryNo(subcategory.getSubCategoryNo());
			
		// board 등록
		if (postNo > 0) {
			
			int boardNo = service.createBoard(b);
			System.out.println(boardNo);
			
			if (boardNo > 0) { 		
				
				//첨부파일, 이미지 파일 저장
				Attachment attachment = fileStore.storeFile(upfile);
				ImgAttachment image = fileStore.storeImage(thumbnailImage);
				
				if(attachment!=null) {attachment.setRefBno(boardNo);}
				if(image!=null) {image.setRefBno(boardNo);}
				
				System.out.println(attachment);
				System.out.println(image);
				
				int result = service.insertFiles(attachment,image);
				
				
				
				mv.addObject("alert", "게시글 작성 성공"); }
			else { 
				mv.addObject("alert", "게시글 작성 실패"); 
			}
		} else {
			mv.addObject("alert", "게시글 작성 실패");
		}

		
		mv.setViewName("redirect:../../pledge/list");
		return mv;
	}
	
	
	
	//수정날짜 바꿀때 사용할거
//	LocalDateTime nowTime = LocalDateTime.now();
//	java.sql.Date date = java.sql.Date.valueOf(nowTime.toLocalDate());
//	b.setModifyDate(date);
//	System.out.println("date = "  +date);
		

		
	
	
	
	
}
