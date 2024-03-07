package com.kks.trashpedia.member.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.member.model.service.MemberService;
import com.kks.trashpedia.member.model.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

	private final PasswordEncoder passwordEncoder;

	private final MemberService service;

	// 마이페이지 이동
	@GetMapping("/myPage")
	public ModelAndView myPage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession Session = request.getSession();
		Member authentication = (Member) Session.getAttribute("authentication");
		int userNumber = authentication.getUserNo(); // int 타입의 userNo 가져오기

		// userNo를 사용하여 새로운 Member 객체 생성
		Member m = new Member();
		m.setUserNo(userNumber);
		
		Member member = service.loginMember(m);
		
//		session.setAttribute("member", member);
		if (authentication == null) {
			mav.addObject("errorMessage", "로그인이 필요합니다.");
			mav.setViewName("user/login");
		} else {
			int userNo = authentication.getUserNo();
			List<Board> myPost = service.pledgeList(userNo);
			List<Board> myComment = service.commentList(userNo);

			mav.addObject("member", member);
			mav.addObject("authentication", authentication);
			mav.addObject("myPost", myPost);
			mav.addObject("myComment", myComment);
			mav.setViewName("user/myPage");
		}
		return mav;
	}

	// 아이디중복체크
	@GetMapping("/emailCheck")
	public int emailCheck(String userEmail) {
		return service.emailCheck(userEmail);
	}

	// 회원가입페이지 이동
	@GetMapping("/join")
	public ModelAndView joinForm() {
		return new ModelAndView("user/join");
	}

	// 회원가입기능
	@PostMapping("/join")
	public ModelAndView joinMember(Member m, HttpServletResponse res) {
		ModelAndView mav = new ModelAndView();
		String encodedPassword = passwordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encodedPassword);

		int result = service.joinMember(m);

		if (result > 0) {
			mav.addObject("alert", "회원가입에 성공했습니다");
			mav.setViewName("redirect:/login");
		} else {
			mav.addObject("alert", "회원가입에 실패했습니다");
			mav.setViewName("redirect:/join");
		}
		return mav;
	}

	@GetMapping("/findEmail")
	public String findEmail(String userName, String phone) {
		String userEmail = service.findEmail(userName, phone);
		if (userEmail != null) {
			return userEmail;
		} else {
			return null;
		}
	}

	@GetMapping("/checkEmail")
	public int checkEmail(String userEmail, String phone) {
		return service.checkEmail(userEmail, phone);

	}

	// 업데이트기능
	@PostMapping("/update.me")
	public ModelAndView  updateMember(Member m, HttpSession session, RedirectAttributes ra, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int result = service.updateMember(m);
		String url = "";

		
		if (result > 0) { // 성공

			// 세션 무효화
//			request.getSession().invalidate();
			mav.setViewName("redirect:/member/myPage");
			System.out.println("뭘까 진짜");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;

	}

	@PostMapping("/delete.me")
	public ModelAndView deleteMember(Member m, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		int result = service.deleteMember(m);
		System.out.print(m.getUserNo());
		if (result > 0) {
			// 회원 정보를 삭제한 경우 세션에서 로그인된 회원 정보를 삭제
//			session.removeAttribute("loginUser");
			mav.setViewName("redirect:/");
//			request.getSession().invalidate();
			// 세션 무효화

		} else {
			// 탈퇴 실패 시 처리할 내용
			mav.setViewName("redirect:/");
		}
		return mav;

	}
}
