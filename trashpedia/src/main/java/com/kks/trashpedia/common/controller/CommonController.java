package com.kks.trashpedia.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
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
	
	//카테고리 정보 가지고오기
	@GetMapping("/write")
	public ModelAndView insertBoard(SubCategory subcategory) {
		
		ModelAndView mv = new ModelAndView();
		SubCategory category = service.getSubCategory(subcategory);
		mv.addObject("category",category);
		mv.setViewName("pledge/pledgeInsert");
		
		return mv;
	}
	
	//게시글 등록
	@PostMapping("/write/{bigCategoryNo}/{subCategoryNo}")
	public ModelAndView insertBoard(
			SubCategory subcategory, Post p,
			RedirectAttributes ra, @RequestParam("thumbnailImage") MultipartFile thumbnailImage,
			@RequestParam("upfile") MultipartFile upfile, HttpServletRequest request
			) {

		ModelAndView mv = new ModelAndView();
		Board b = new Board();
		
		// post 등록
		int postNo = service.createPost(p);

		b.setPostNo(postNo);
		b.setSubCategoryNo(subcategory.getSubCategoryNo());
		
		// board 등록
		if (postNo > 0) {
			int result = service.createBoard(b);
			if (result > 0) { mv.addObject("alert", "게시글 작성 성공"); }
			else { mv.addObject("alert", "게시글 작성 실패"); }
		} else {
			mv.addObject("alert", "게시글 작성 실패");
		}
		
		// 첨부 이미지 저장
		
		
		
		
		//이미지 저장할 경로 얻어오기
		/* String webPath = '/resources/images/' */
		
		
		mv.setViewName("pledge/pledgeView");		
		return mv;
	}
	
	
		
		
	
	
	
	
}
