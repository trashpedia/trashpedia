package com.kks.trashpedia.member.controller;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.member.model.service.MemberService;
import com.kks.trashpedia.member.model.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
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
		Member authentication = (Member) request.getSession().getAttribute("authentication");

		if (authentication == null) {
			mav.addObject("errorMessage", "로그인이 필요합니다.");
			mav.setViewName("user/login");
		} else {
			int userNo = authentication.getUserNo();

			Member member = service.getMember(userNo);
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
	public ModelAndView joinMember(Member m) {
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
	public ModelAndView updateMember(Member m) {

		ModelAndView mav = new ModelAndView();
		int result = service.updateMember(m);

		if (result > 0) {
			mav.addObject("alert", "회원 정보가 업데이트되었습니다. 재로그인 해주세요");
			mav.setViewName("user/login");
		} else {
			mav.addObject("alert", "회원 정보 수정에 실패했습니다. 다시 시도해주세요");
			mav.setViewName("redirect:/member/myPage");
		}
		return mav;
	}

	// 페스워드 확인
	@PostMapping("/pwdAuth.me")
	public ModelAndView pwdAuth(Member m) {

		ModelAndView mav = new ModelAndView();
		

		int userNo = m.getUserNo(); // 접속한 유저번호

		// 사용자가 제출한 비밀번호
		String submittedPassword = m.getUserPwd(); // 암호화 안됨
		
		Member member = service.getMember(userNo); // userNo를 통해 회원 정보를 가져와서
		
		String hashedPasswordFromDatabase = member.getUserPwd(); // 암호화된 Pwd

		if (passwordEncoder.matches(submittedPassword, hashedPasswordFromDatabase)) { // 받은 페스워드, 기존암호화된 페스워드 확인
			// 비밀번호가 일치함
			mav.addObject("alert", "페스워드 인증성공");
			mav.setViewName("redirect:/member/myPage");
			// 로그인 성공 처리
		} else {
			// 비밀번호가 일치하지 않음
			mav.addObject("alert", "패스워드 인증실패");
			mav.setViewName("redirect:/member/myPage");
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

	@GetMapping("/socialJoin")
	public ModelAndView joinSocialMember(Member m, Long socialId, String socialType) {
		ModelAndView mav = new ModelAndView();
		String encodedPassword = passwordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encodedPassword);

		int result = service.joinSocialMember(m, socialId, socialType);

		if (result > 0) {
			mav.addObject("alert", "회원가입에 성공했습니다");
			mav.setViewName("redirect:/login");
		} else {
			mav.addObject("alert", "회원가입에 실패했습니다");
			mav.setViewName("redirect:/join");
		}
		return mav;
	}

}
