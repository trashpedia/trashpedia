package com.kks.trashpedia.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kks.trashpedia.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/insert.me")
	public String enrollForm(){
		return "/user/join";
	}
	
	
	
}
