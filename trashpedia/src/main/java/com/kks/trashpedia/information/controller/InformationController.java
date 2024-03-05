package com.kks.trashpedia.information.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.information.model.service.InformationService;

@RestController
@RequestMapping("/information")
public class InformationController {

	@Autowired
	private InformationService service;
	
	// 정보자료글 페이지 이동
	@GetMapping("/list")
	public ModelAndView showEncyclopediaPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("information/InformationView");
		return modelAndView;
	}

	// 정보자료글 보기 & 페이징,검색
	@GetMapping("/loadListData")
	public ResponseEntity<Page<Post>> loadListData(@RequestParam int subCategoryNo,
			@PageableDefault(size = 8, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam int page, @RequestParam String sort, @RequestParam String searchSelect,
			@RequestParam String searchValue) {

		Page<Post> pages = service.loadListData(pageable, page, sort, searchSelect, searchValue, subCategoryNo);

		return ResponseEntity.ok(pages);
	}
	
	
	
	
	
	
	
}
