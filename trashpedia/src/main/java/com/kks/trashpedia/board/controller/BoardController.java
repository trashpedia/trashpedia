package com.kks.trashpedia.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.board.model.service.BoardService;

@RestController
public class BoardController {
	@Autowired
	private BoardService service;
	
	
}