package com.kks.trashpedia.pledge.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.pledge.model.service.PledgeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/pledge")
public class PledgeController {
	
	@Autowired
	private PledgeService service;

	//실천서약 페이지 이동
	@GetMapping("/list")
	public ModelAndView pledgeList(int subCategoryNo) {
		
		ModelAndView mav = new ModelAndView();
		List<Post> pledgeList = service.pledgeList(subCategoryNo);
		
		mav.addObject("list", pledgeList);
		mav.setViewName("pledge/pledgeView");
		
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

	
	
//	//실천서약 상세 페이지 이동
//	@GetMapping("/view")
//	public ModelAndView pledgeDetilaView() {
//				
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("pledge/pledgeDetailView");
//		
//		return mav;
//	}	
//	
//	
//	// 실천인증 상세페이지 이동
//	@GetMapping("/certificationView")
//	public ModelAndView pledgeCertificationDetailView() {
//		
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("pledge/pledgeCertificationDetailView");
//		
//		return mav;
//	}
	
	//실천 상세 페이지 이동
	@GetMapping("/detail/{postNo}")
	public ModelAndView pledgeDetail(
			@PathVariable int postNo,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session
			) {
		
		ModelAndView mav = new ModelAndView();
		Post post = service.pledgeDetail(postNo); 
		Board b = new Board();
		
		b.setBoardNo(post.getBoardNo());
		b.setUserNo(post.getUserNo());
		
		System.out.println(b);
		
		//Member loginUser = (Member) session.getAttribute("loginUser");  

		//조회수
//		if (loginUser != null) {
//			userNo = loginUser.getUserNo();
//		}
//		
//		if(post.getUserNo() != userNo) {
//			Cookie cookie = null;
//			Cookie[] cArr = req.getCookies();
//			
//			if(cArr != null && cArr.length > 0) {
//				for(Cookie c : cArr) {
//					if("readBoardNo".equals(c.getName())) {
//						cookie = c;
//						break;
//					}
//				}
//			}
//			int result = 0;
//			if(cookie == null) {
//				cookie = new Cookie("readBoardNo", boardNo + "");
//				result = service.increaseCount(boardNo);
//			} else {
//				String[] arr = cookie.getValue().split("/");
//				List<String> list = Arrays.asList(arr);
//				if(list.indexOf(boardNo+"") == -1) {
//					result = service.increaseCount(boardNo);
//					cookie.setValue(cookie.getValue()+"/"+boardNo);
//				}
//			}
//			if(result>0) {
//				post.setHitsNo(post.getHitsNo()+1);
//				cookie.setPath(req.getContextPath());
//				cookie.setMaxAge(1*60*60); //초기화시간
//				res.addCookie(cookie);
//			}
//		} else {
//			System.out.println("조회실패");
//		}
//		
		//처음 조회일 조회
		List<Date> hitsDate = service.pledgeHitDate(b);
		System.out.println(hitsDate);

		
		//int result = service.increaseCount(b);
		
		mav.addObject("post", post);
		mav.setViewName("pledge/pledgeDetailView");
		
		return mav;
		
	}
	
	
	
	
	
}