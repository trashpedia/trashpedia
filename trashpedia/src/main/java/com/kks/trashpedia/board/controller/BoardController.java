package com.kks.trashpedia.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kks.trashpedia.board.model.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	// 무료나눔 페이지 이동
	@GetMapping("/freeShare")
	public String boardFreeShare() {
		return "board/freeShare/freeShare";
	}
	
	
}