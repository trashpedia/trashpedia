package com.kks.trashpedia.member.controller;

import java.security.Provider.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kks.trashpedia.member.model.service.MemberService;
import com.kks.trashpedia.member.model.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("loginUser")
public class MemberController {
	
	
	@Autowired
	private MemberService service;

	//로그인페이지 이동
	@GetMapping("login")
	public String loginForm() {
		return "user/login";
	}
	
	public MemberController() {
		
	}
	
	//회원가입페이지 이동
	@GetMapping("join")
	public String joinForm(){
		return "user/join";
	}
	
	//마이페이지 이동
	@GetMapping("myPage")
	public String myPage(){
		return "user/myPage";
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
	
	@PostMapping("update.me")
	public ModelAndView updateMember(
	        Member m,
	        Model model,
	        HttpSession session,
	        RedirectAttributes ra
	) {

	    int result = service.updateMember(m);
	    ModelAndView mv = new ModelAndView();
	    System.out.println(m);
	    System.out.println("수정중");
	    
	    if (result > 0) {
	        Member updateMember = service.loginMember(m);
	        model.addAttribute("loginUser", updateMember);

	        ra.addFlashAttribute("alertMsg", "내정보 수정성공");
	        mv.setViewName("redirect:/myPage.me");
	    } else {
	        model.addAttribute("errorMsg", "회원정보수정실패");
	        System.out.println("실패");
	        mv.setViewName("main");
	    }
	    return mv;
	}
	
	//로그인기능
	@PostMapping("login.me")
	public ModelAndView loginMember(@ModelAttribute Member m, HttpSession session, Model model, ModelAndView mv) {
		
	    Member loginUser = service.loginMember(m);
	    
	    if (loginUser != null) {
	        // 로그인 성공 시 세션에 loginUser 저장
	    	model.addAttribute("loginUser", loginUser);
	    	
	    	
	        System.out.println("로그인기능확인");
		    System.out.println(loginUser);
	        // 로그인 성공 후 이동할 페이지로 ModelAndView 설정
	        mv.setViewName("redirect:/"); // 예시: home 페이지로 이동
	    } else {
	        // 로그인 실패 처리
	        // 예를 들어 로그인 실패 메시지를 모델에 추가하고 다시 로그인 페이지로 이동
	        model.addAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        mv.setViewName("login"); // 예시: 로그인 폼 페이지로 이동
	    }
	    
	    return mv;
	}
		
	
}
