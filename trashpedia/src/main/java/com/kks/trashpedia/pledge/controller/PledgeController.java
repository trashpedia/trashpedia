package com.kks.trashpedia.pledge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kks.trashpedia.pledge.model.service.PledgeService;

@Controller
public class PledgeController {
	@Autowired
	private PledgeService service;
	
	//실천하기 페이지 이동
	@GetMapping("/pledgelist")
	public String encyclopediaFrom() {
		return "pledge/pledgeView";
	}
	
}