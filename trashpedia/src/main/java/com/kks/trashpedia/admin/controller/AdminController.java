package com.kks.trashpedia.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.admin.model.service.adminService;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.member.model.vo.Member;

@RestController
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private adminService service;
	// 메인페이지
	@GetMapping("")
	public ModelAndView adminMain() {
		int allMember = service.allMember();
		int allBoard = service.allBoard();
		int newMember = service.newMember();
		int oldMember = service.oldMember();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("allMember", allMember);
		mav.addObject("allBoard", allBoard);
		mav.addObject("newMember", newMember);
		mav.addObject("oldMember", oldMember);
		mav.setViewName("admin/adminMain");
		return mav;
	}
	// 메인페이지 맴버 차트
	@GetMapping("/getMemberData")
	public String getMemberData() {
	    List<Member> chartData = service.getMemberData();
	    StringBuilder json = new StringBuilder();
	    json.append("[");
	    for (Member data : chartData) {
	        json.append("{");
	        int orderDay = Integer.parseInt(data.getOrderDay().substring(data.getOrderDay().length() - 2));
	        json.append("\"orderDay\": ").append(orderDay).append(", ");
	        json.append("\"countMember\": ").append(data.getCountMember());
	        json.append("}, ");
	    }
	    if (!chartData.isEmpty()) {
	        json.delete(json.length() - 2, json.length());
	    }
	    json.append("]");
	    return json.toString();
	}
	// 관리자 로그인
	@GetMapping("/login")
	public ModelAndView adminLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminLogin");
		return mav;
	}
	// 관리자 회원 관리
	@GetMapping("/member")
	public ModelAndView memberManagement() {
		int cam = service.countAllMember();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cam",cam);
		mav.setViewName("admin/memberManagement");
		return mav;
	}
	// 관리자 회원 관리 회원 리스트
	@GetMapping("/getMember")
	public ResponseEntity<Page<Member>> getMember(@PageableDefault(page = 0, size = 20, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
		Page<Member> page = service.getMember(pageable);
		return ResponseEntity.status(HttpStatus.OK).body(page);
	}
	// 관리자 회원 관리 유저 상세
	@GetMapping("/getMemberDetail")
	public Member getMemberDetail(@RequestParam int userNo) {
		return service.getMemberDetail(userNo);
	}
	
	// 관리자 회원 관리 유저 상세 페이지
	@GetMapping("/member/detail")
	public ModelAndView memberManagementDetail(@RequestParam int userNo) {
		Member m = service.mmDetailMember(userNo);
		int b = service.countBoard(userNo);
		int c = service.countComment(userNo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("m",m);
		mav.addObject("b",b);
		mav.addObject("c",c);
		mav.setViewName("admin/memberManagementDetail");
		return mav;
	}
	// 관리자 회원 관리 게시글 리스트
	@GetMapping("/getBoardList")
	public ResponseEntity<Page<Board>> getBoardList(@PageableDefault(page = 0, size = 20, sort = "id", direction = Sort.Direction.DESC) @RequestParam int userNo, Pageable pageable) {
		Page<Board> page = service.getBoardList(pageable, userNo);
		return ResponseEntity.status(HttpStatus.OK).body(page);
	}
	// 관리자 회원 관리 게시글 상세
	@GetMapping("/getBoardDetail")
	public Board getBoardDetail(@RequestParam int boardNo) {
		return service.getBoardDetail(boardNo);
	}
	// 관리자 회원 관리 게시글 리스트
		@GetMapping("/getCommentList")
		public ResponseEntity<Page<Comment>> getCommentList(@PageableDefault(page = 0, size = 20, sort = "id", direction = Sort.Direction.DESC) @RequestParam int userNo, Pageable pageable) {
			Page<Comment> page = service.getCommentList(pageable, userNo);
			return ResponseEntity.status(HttpStatus.OK).body(page);
		}
		// 관리자 회원 관리 게시글 상세
		@GetMapping("/getCommentDetail")
		public Board getCommentDetail(@RequestParam int boardNo) {
			return service.getCommentDetail(boardNo);
		}
	
	@GetMapping("/trash")
	public ModelAndView trashManagement() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/trashManagement");
		return mav;
	}
	
	// 관리자 게시판 관리
	@GetMapping("/board")
	public ModelAndView boardManagement() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/boardManagement");
		return mav;
	}
	@GetMapping("/{boardId}")
	public String boardId(@PathVariable String boardId) {
		return boardId + "admin";
	}
	
	@GetMapping("/update")
	public String boardUpdate(@RequestParam String boardId) {
		return boardId + "update";
		// localhost:8085/trashpedia/update?boardId=3
		// boardId에 3 값을 가져옴
	}
}
