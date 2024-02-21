package com.kks.trashpedia.pledge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.pledge.model.service.PledgeService;

@RestController
@RequestMapping("/pledge")
public class PledgeController {
	
	@Autowired
	private PledgeService service;

	//실천하기 페이지 이동
	@GetMapping("/list")
	public ModelAndView pledgeList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pledge/pledgeView");
		
		return mav;
	}
	
	//실천서약 상세 페이지 이동
	@GetMapping("/view")
	public ModelAndView pledgeDetilaView() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pledge/pledgeDetailView");
		
		return mav;
	}	
	
	
	// 실천인증 상세페이지 이동
	@GetMapping("/certificationView")
	public ModelAndView pledgeCertificationDetailView() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pledge/pledgeCertificationDetailView");
		
		return mav;
	}
	
	// 게시글 등록하기 페이지 이동
	@GetMapping("/insert")
	public ModelAndView pledgeInsert() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pledge/pledgeInsert");
		
		return mav;
	}
	
	// 게시글 수정 페이지 이동
	@GetMapping("/modify")
	public ModelAndView pledgeModify() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pledge/pledgeModify");
		
		return mav;
	}

	
	
	
	
}