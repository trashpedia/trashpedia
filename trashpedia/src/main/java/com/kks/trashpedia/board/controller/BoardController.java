package com.kks.trashpedia.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.service.BoardService;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.member.model.vo.Member;

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
	
	//공지사항 목록페이지 이동
	@GetMapping("/boardNotice")
	public ModelAndView boardNotice(int subCategoryNo ) {
		ModelAndView mav = new ModelAndView();
		List<Post> boardList = service.boardList(subCategoryNo);
		mav.addObject("boardList", boardList);
		System.out.println("boardList"+boardList);
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
	 @GetMapping("/boardDetail")
	    public ModelAndView boardDetail(@PathVariable int postNo) {
	        ModelAndView mav = new ModelAndView();
	        Board board = service.boardDetail(postNo);
	        mav.addObject("board", board);
	        System.out.println("board" + board);
	        mav.setViewName("board/notice/boardDetail");
	        return mav;
	    }
	 
	 
	 
	
	

	
	
}