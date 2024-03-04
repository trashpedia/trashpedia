package com.kks.trashpedia.member.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
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

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private MemberService service;

	@Autowired
	private AuthService authService;

	// 로그인페이지 이동
	@GetMapping("/login")
	public String loginForm() {
		return "user/login";
	}

	@PostMapping("/login/authenticate")
	public ModelAndView login(@RequestParam String userId, @RequestParam String userPwd) {
		// String up = userPwd; // 암호화 메소드
		String encryptedPassword = passwordEncoder.encode(userPwd); // 비밀번호 암호화
		Member m = new Member().builder().userEmail(userId).userPwd(encryptedPassword).build();

		boolean isAuthenticated = checkAuthentication(m);
		ModelAndView mav = new ModelAndView();

		// m // Member에 비교
		if (isAuthenticated) {
			// 권한 정보 가져오기
			User auth = (User) authService.loadUserByUsername(userId);
			mav.setViewName("redirect:/");
			System.out.println("성공이다!");
		} else {
			// 아이디 혹은 비밀번호가 없습니다.
			mav.addObject("errorMessage", "아이디 혹은 비밀번호가 올바르지 않습니다.");
			mav.setViewName("redirect:/login");
			System.out.println("실패다!");

		}

		return mav;
	}

	private boolean checkAuthentication(Member m) {
		try {
			authService.authenticateByEmail(m.getUserEmail(), m.getUserPwd(), passwordEncoder);
			return true; // 인증 성공
		} catch (UsernameNotFoundException e) {
			// 회원 인증 실패
			return false;
		}
	}

	// 회원가입페이지 이동
	@GetMapping("/join")
	public String joinForm() {
		return "user/join";
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

//	@PostMapping("/join.me")
//	public ModelAndView joinMember(Member m, HttpServletResponse res) {
//		String encodedPassword = passwordEncoder.encode(m.getUserPwd());
//		m.setUserPwd(encodedPassword);
//		
//		System.out.println(m);
//		System.out.println(m.getZipcode());
//		
//		
//		/*
//		 * if(!m.getZipcode()) { System.out.println("not null"); }
//		 */
//	
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("main");
//
//		service.joinMember(m);
//		return mav;
//	}
	// 회원가입기능
	@PostMapping("/join.me")
	public ModelAndView joinMember(Member m, HttpServletResponse res) {
		String encodedPassword = passwordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encodedPassword);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");

		service.joinMember(m);
		return mav;
	}

	// 로그인기능
//	@GetMapping("/saveUserData")
//	public ModelAndView loginMember(Authentication authentication, HttpSession session, Model model, ModelAndView mv) {
//		
//	   // Member loginUser = service.loginMember(m);
//	   // User loginUser = authService.loadUserByUsername(m.getUserEmail());
//	    model.addAttribute("loginUser", authentication.getPrincipal());
//	    
//		/*
//		 * if (loginUser != null) { // 로그인 성공 시 세션에 loginUser 저장
//		 * model.addAttribute("loginUser", loginUser);
//		 * 
//		 * 
//		 * System.out.println("로그인기능확인"); System.out.println(m); // 로그인 성공 후 이동할 페이지로
//		 * ModelAndView 설정 mv.setViewName("main"); // 예시: home 페이지로 이동 } else { // 로그인
//		 * 실패 처리 // 예를 들어 로그인 실패 메시지를 모델에 추가하고 다시 로그인 페이지로 이동
//		 * model.addAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
//		 * mv.setViewName("login"); // 예시: 로그인 폼 페이지로 이동 }
//		 */
//	    mv.setViewName("redirect:/");
//	    
//	    return mv;
//	}

	@GetMapping("/saveUserData")
	public ModelAndView loginMember(Authentication authentication, HttpSession session, Model model, ModelAndView mv) {
		model.addAttribute("loginUser", authentication.getPrincipal());
		mv.setViewName("redirect:/");
		return mv;
	}

	// 업데이트기능
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

	// 실천 상세 페이지 이동
//	@GetMapping("/detail/{postNo}")
//	public ModelAndView pledgeDetail(@PathVariable int postNo, HttpServletRequest req, HttpServletResponse res,
//			HttpSession session) {
//
//		ModelAndView mav = new ModelAndView();
//		// 글내용 조회
//		Post post = service.pledgeDetail(postNo);
//		Board b = new Board();
//
//		// 이미지,첨부파일,카테고리
//		ImgAttachment img = service.pledgeDetailImg(post.getBoardNo());
//		Attachment attach = service.pledgeDetailAttach(post.getBoardNo());
//
//		b.setImgAttachment(img);
//		b.setAttachment(attach);
//
//		b.setBoardNo(post.getBoardNo());
//		b.setUserNo(post.getUserNo());
//
//		int result = 0;
//
//		// 처음 조회일 조회 -> LocalDate로 변환
//		Date hitsDate = service.pledgeHitDate(b);
//
//		// 조회일이 있을 때
//		if (hitsDate != null) {
//			// 조회날짜와 현재날짜 비교
//			LocalDate hitsLocalDate = hitsDate.toLocalDate();
//			LocalDate currentDate = LocalDate.now();
//			int comparisonResult = hitsLocalDate.compareTo(currentDate); // 적으면 -, 같으면 0, 많으면 +값
//			// 현재날짜보다 조회날짜가 작을 때
//			if (comparisonResult < 0) {
//				result = service.increaseCount(b);
//				post.setHitsNo(post.getHitsNo() + 1);
//			}
//		} else {
//			result = service.increaseCount(b);
//			post.setHitsNo(post.getHitsNo() + 1);
//		}
//
//		mav.addObject("attachment", attach);
//		mav.addObject("img", img);
//		mav.addObject("post", post);
//		mav.setViewName("pledge/pledgeDetailView");
//
//		return mav;
//	}

}
