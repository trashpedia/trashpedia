package com.kks.trashpedia.member.controller;

import java.security.Provider.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.member.model.service.MemberService;
import com.kks.trashpedia.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;

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
	
	@PostMapping("login.me")
	public ModelAndView loginMember(@ModelAttribute Member m, HttpSession session, Model model, ModelAndView mv) {
	    Member loginUser = service.loginMember(m);
	    
	    if (loginUser != null) {
	        // 로그인 성공 시 세션에 loginUser 저장
	        session.setAttribute("loginUser", loginUser);
	        
	        // 로그인 성공 후 이동할 페이지로 ModelAndView 설정
	        mv.setViewName("redirect:/main"); // 예시: home 페이지로 이동
	    } else {
	        // 로그인 실패 처리
	        // 예를 들어 로그인 실패 메시지를 모델에 추가하고 다시 로그인 페이지로 이동
	        model.addAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        mv.setViewName("loginForm"); // 예시: 로그인 폼 페이지로 이동
	    }
	    
	    return mv;
	}
		
	
}
