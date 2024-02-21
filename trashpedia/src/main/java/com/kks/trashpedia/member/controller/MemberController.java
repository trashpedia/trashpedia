package com.kks.trashpedia.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.member.model.service.MemberService;
@RestController
@RequestMapping
public class MemberController {
	
	@Autowired
	private MemberService service;

	//로그인페이지 이동
	@GetMapping("login")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/login");
		return mav;
	}
	
	//회원가입페이지 이동
	@GetMapping("join")
	public ModelAndView joinForm(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/join");
		return mav;
	}
	
	
}
