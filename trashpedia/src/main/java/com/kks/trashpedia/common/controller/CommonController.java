package com.kks.trashpedia.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.common.service.CommonService;

@RestController
public class CommonController {
	
	@Autowired
	private CommonService service;
	
	//카테고리 정보 가지고오기
	@GetMapping("/write")
	public ModelAndView insertBoard(
			SubCategory subcategory
			) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("subcategory"+subcategory);
		List<SubCategory> category = service.getSubCategory(subcategory);
		
		System.out.println("category= "+ category);
		
		
		mv.addObject("category",category);
		mv.setViewName("pledge/pledgeInsert");
		
		return mv;
	}
	
	@PostMapping("/write")
	public String insertBoard(
			Board b, 
			RedirectAttributes ra,
			@RequestParam(value="upThumbNailImg", required=false) MultipartFile upfile
			) {


		//이미지 저장할 경로 얻어오기
		/* String webPath = '/resources/images/' */
		
		
//		commonService.insertBoard(b);
		
		System.out.println("여기까지 되는지 확인");

		return "될까";
		
	}
	
	
		
		
	
	
	
	
}
