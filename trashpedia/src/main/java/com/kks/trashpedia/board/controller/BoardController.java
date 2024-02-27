package com.kks.trashpedia.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.service.BoardService;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;

@RestController
public class BoardController {
	
	@Autowired
	private BoardService service;

	//게시판 메인페이지 이동
	@GetMapping("/board")
	public ModelAndView boardMain() {
		List<BigCategory> bc = service.bigCategory();
		List<SubCategory> sc = service.subCategory();
		ModelAndView mav = new ModelAndView();
		mav.addObject("bc",bc);
		mav.addObject("sc",sc);
		mav.setViewName("board/boardMain");
		return mav;
	}
	
	//정보자료글 페이지 이동
	@GetMapping("/boardInformation")
	public ModelAndView boardInformation() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/information/informationList");
		return mav;
	}
	
	// 무료나눔 페이지 이동
	@GetMapping("/boardFreeShare")
	public ModelAndView boardFreeShare() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/freeShare/freeShare");
		return mav;
	}
	
	//공지사항 목록페이지 이동
	@GetMapping("/boardList")
	public ModelAndView boardNotice(@PageableDefault(size = 15, sort = "boardNo", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam int subCategoryNo,
			@RequestParam int page,
			@RequestParam String filter,
			@RequestParam String searchSelect,
			@RequestParam String searchValue) {
		Page<Board> pages = service.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", pages);
		System.out.println("boardList"+pages);
		mav.setViewName("board/notice/boardList");
		return mav;
	}
	
	//건의게시판 페이지 이동
	@GetMapping("/boardSuggestion")
	public ModelAndView boardSuggestion() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/suggestion/boardList");
		return mav;
	}
	
	//공지사항 상세페이지 이동
	 @GetMapping("/boardDetail/{postNo}")
	    public ModelAndView boardDetail(@PathVariable int postNo) {
	        ModelAndView mav = new ModelAndView();
	        Post board = service.boardDetail(postNo);
	        mav.addObject("board", board);
	        System.out.println("board" + board);
	        mav.setViewName("board/notice/boardDetail");
	        return mav;
	    }
	 
	 
	 
	
	

	
	
}