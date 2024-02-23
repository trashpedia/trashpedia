package com.kks.trashpedia.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.service.BoardService;

@RestController
public class BoardController {
	
	@Autowired
	private BoardService service;

	//게시판 메인페이지 이동
	@GetMapping("/board")
	public ModelAndView boardMain() {
		ModelAndView mav = new ModelAndView();
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

	
	
}