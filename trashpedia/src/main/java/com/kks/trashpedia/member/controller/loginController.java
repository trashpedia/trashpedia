package com.kks.trashpedia.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.member.model.service.MemberService;
@RestController
@RequestMapping
public class loginController {
	
	@Autowired
	private MemberService service;

	//아이디 찾기 페이지로 이동
	@GetMapping("login.me")
	public ModelAndView findForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/");
		return mav;
	}
	

}
