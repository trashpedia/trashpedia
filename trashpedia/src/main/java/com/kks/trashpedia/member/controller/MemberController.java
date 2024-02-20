package com.kks.trashpedia.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kks.trashpedia.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	//로그인페이지 이동
	@GetMapping("login.me")
	public String loginForm() {
		return "/user/login";
	}
	
	//회원가입페이지 이동
	@GetMapping("/insert.me")
	public String joinForm(){
		return "/user/join";
	}
	
	
}
