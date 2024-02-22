package com.kks.trashpedia.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.member.model.service.MemberService;
import com.kks.trashpedia.member.model.vo.Member;

@RestController
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
	
	@GetMapping("myPage")
	public ModelAndView myPage(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/myPage");
		return mav;
	}
	
	@PostMapping("join.me")
	public ModelAndView joinMember(Member m) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		System.out.println("되냐?");
		System.out.println(m);
		
	
		service.joinMember(m);
		
		return mav;
	}
	
	

	
	
	
}
