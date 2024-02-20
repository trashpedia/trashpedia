package com.kks.trashpedia.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kks.trashpedia.board.model.service.BoardService;

@Controller
public class AdminController {

	@Autowired
	private BoardService service;
	
	//어드민페이지 이동
	@GetMapping("/adminlist")
	public String encyclopediaFrom() {
		return "admin/adminMain";
	}
	
	
	
}
