package com.kks.trashpedia.member.controller;

import java.security.Provider.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	

	//로그인기능
	@PostMapping("login.me")
	public ModelAndView loginMember(@ModelAttribute Member m, HttpSession session, Model model, ModelAndView mv) {
		
	    Member loginUser = service.loginMember(m);
	    
	    if (loginUser != null) {
	        // 로그인 성공 시 세션에 loginUser 저장
	    	model.addAttribute("loginUser", loginUser);
	    	
	    	
	        System.out.println("로그인기능확인");
		    System.out.println(m);
	        // 로그인 성공 후 이동할 페이지로 ModelAndView 설정
	        mv.setViewName("main"); // 예시: home 페이지로 이동
	    } else {
	        // 로그인 실패 처리
	        // 예를 들어 로그인 실패 메시지를 모델에 추가하고 다시 로그인 페이지로 이동
	        model.addAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        mv.setViewName("login"); // 예시: 로그인 폼 페이지로 이동
	    }
	    
	    return mv;
	}
	
	//업데이트기능
	@PostMapping("update.me")
	public String updateMember(
	        Member m,
	        Model model,
	        HttpSession session,
	        RedirectAttributes ra
	) {
	    int result = service.updateMember(m);
	    String url="";
	    System.out.println(m);
	    System.out.println("수정중");
	    
	    if (result > 0) {
	        Member updateMember = service.loginMember(m);
	        session.setAttribute("loginUser", updateMember); // 수정된 회원 정보를 세션에 저장
	        System.out.println("성공하자");
	        url = "redirect:/myPage"; // 수정 성공 시 내 정보 페이지로 이동
	    } else {
	        model.addAttribute("errorMsg", "회원정보수정실패");
	        System.out.println("실패");
	        url = "main"; // 수정 실패 시 메인 페이지로 이동
	    }
	    return url;
	}
	@PostMapping("delete.me")
	public String deleteMember( Member m, HttpSession session) {
		Member loginUser = service.loginMember(m);
		System.out.println(m);
		
	    int result = service.deleteMember(m);
	    if (result > 0) {
	        // 회원 정보를 삭제한 경우 세션에서 로그인된 회원 정보를 삭제
	    	
	        session.removeAttribute("loginUser");
	        System.out.println("성공이유~");
	        return "main"; // 메인 페이지로 이동 또는 다른 적절한 경로로 이동
	    } else {
	        // 탈퇴 실패 시 처리할 내용
	        System.out.println("실패유~");
	        return "login"; // 에러 페이지로 이동 또는 다른 적절한 경로로 이동
	    }
		
	}
	

	
	
		
	
}
