package com.kks.trashpedia.member.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.kks.trashpedia.auth.model.service.AuthService;
import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;

import com.kks.trashpedia.member.model.service.MemberService;
import com.kks.trashpedia.member.model.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private MemberService service;

	@Autowired
	private AuthService authService;

	private boolean checkAuthentication(Member m) {
		try {
			authService.authenticateByEmail(m.getUserEmail(), m.getUserPwd(), passwordEncoder);
			return true; // 인증 성공
		} catch (UsernameNotFoundException e) {
			// 회원 인증 실패
			return false;
		}
	}

	// 마이페이지 이동
	@GetMapping("/myPage")
	public String myPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		Member loggedInUser = (Member) session.getAttribute("loginUser");
		if (loggedInUser == null) {
			// 사용자가 로그인되지 않은 경우 처리
			mav.addObject("errorMessage", "로그인이 필요합니다.");
			return "common/errorPage/errorPage";
		} else {
			String userEmail = loggedInUser.getUserEmail();
			List<Post> myPost = service.pledgeList(userEmail);
			List<Comment> myComment = service.commentList(userEmail);

			mav.addObject("myPost", myPost);
			mav.addObject("myComment", myComment);
			return "user/myPage";
		}
	}

	// 아이디중복체크
	// 마이페이지 이동
	@ResponseBody
	@GetMapping("/idCheck.me")
	public int idCheck(String userEmail) {

		return service.idCheck(userEmail);
	}
  
	//회원가입페이지 이동
	@GetMapping("/join")
	public ModelAndView joinForm(){
		return new ModelAndView("user/join");
	}
	
	//회원가입기능
	@PostMapping("/join")
    public ModelAndView joinMember(Member m, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
        String encodedPassword = PasswordEncoder.encode(m.getUserPwd());
        m.setUserPwd(encodedPassword);

        int result = service.joinMember(m);

        if(result > 0) {
        	mav.addObject("alert","회원가입에 성공했습니다");
        	mav.setViewName("redirect:/login");
        } else {
        	mav.addObject("alert","회원가입에 실패했습니다");
        	mav.setViewName("redirect:/join");
        }
        return mav;
    }
	
	@GetMapping("/saveUserData")
	public ModelAndView loginMember(Authentication authentication, HttpSession session, Model model, ModelAndView mv) {
	    model.addAttribute("loginUser", authentication.getPrincipal());
	mv.setViewName("redirect:/");
	    return mv;
	}
	
	//업데이트기능
	@PostMapping("/update.me")
	public String updateMember(Member m, Model model, HttpSession session, RedirectAttributes ra) {
		int result = service.updateMember(m);
		String url = "";

		if (result > 0) {
			Member updateMember = service.loginMember(m);
			session.setAttribute("loginUser", updateMember);
			url = "redirect:/myPage";
		} else {
			model.addAttribute("errorMsg", "회원정보수정실패");
			url = "main";
		}
		return url;
	}

	@PostMapping("/delete.me")
	public String deleteMember(Member m, HttpSession session) {

		int result = service.deleteMember(m);
		if (result > 0) {
			// 회원 정보를 삭제한 경우 세션에서 로그인된 회원 정보를 삭제
			session.removeAttribute("loginUser");
			return "main";
		} else {
			// 탈퇴 실패 시 처리할 내용
			return "login";
		}

	}
}
