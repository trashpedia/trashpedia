package com.kks.trashpedia.board.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.kks.trashpedia.board.model.service.BoardService;
import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.pledge.model.service.PledgeService;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	@Autowired 
	private PledgeService pservice;
	
	

	// 게시판 메인페이지 이동
	@GetMapping("")
	public ModelAndView boardMain() {
		List<BigCategory> bc = service.bigCategory();
		List<SubCategory> sc = service.subCategory();
		List<Post> post = service.categoryList();
		ModelAndView mav = new ModelAndView();

		mav.addObject("bc",bc);
		mav.addObject("sc",sc);
		mav.addObject("post",post);

		mav.setViewName("board/boardMain");
		return mav;
	}

	// 정보자료글 페이지 이동
	@GetMapping("/boardInformation")
	public ModelAndView boardInformation() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/information/informationList");
		return mav;
	}

	// 무료나눔 페이지 이동
	@GetMapping("/list")
	public ModelAndView boardFreeShare(int subCategoryNo) {
		ModelAndView mav = new ModelAndView();
		List<Post> boardFreeTrashList = service.getFreeTrashList(subCategoryNo); // 이 메서드는 인기 쓰레기 정보를 가져오는 메서드
		mav.addObject("list", boardFreeTrashList);
		mav.setViewName("board/freeShare/freeShare");
		return mav;
	}
	// 검색 기능
	@GetMapping("/searchByTitle")
	public ModelAndView searchByTitle(@RequestParam String title) {
	    ModelAndView mav = new ModelAndView();
	    Post post = service.getPostByTitle(title); // 제목으로 게시물 조회
	    if (post != null) {
	        mav.setViewName("pledge/pledgeDetailView");
	    } else {
	        // 게시물이 없을 경우 처리
	        mav.setViewName("errorPage"); // 에러 페이지로 이동하거나 다른 방식으로 처리
	    }
	    return mav;
	}
	
	// 무료나눔 상세 페이지 이동
	@GetMapping("/detail/{postNo}")
	public ModelAndView boardFreeShareDetail(
			@PathVariable int postNo,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session
			) {
		
		ModelAndView mav = new ModelAndView();
		//글내용 조회
		Post post = service.getFreeTrashDetail(postNo); 
		Board b = new Board();
		
		//이미지,첨부파일,카테고리
		ImgAttachment img = service.getImageUrlByboardNo(post.getBoardNo());
		Attachment attach = service.getDetailAttach(post.getBoardNo());
		
		b.setImgAttachment(img);
		b.setAttachment(attach);
		
		b.setBoardNo(post.getBoardNo());
		b.setUserNo(post.getUserNo());
	

//		
		int result = 0;
		
		// 처음 조회일 조회 -> LocalDate로 변환
		Date hitsDate = service.pledgeHitDate(b);
		
		// 조회일이 있을 때
		if(hitsDate !=null) {
			//조회날짜와 현재날짜 비교
			LocalDate hitsLocalDate = hitsDate.toLocalDate();
			LocalDate currentDate = LocalDate.now();
			int comparisonResult = hitsLocalDate.compareTo(currentDate); // 적으면 -, 같으면 0, 많으면 +값 
			// 현재날짜보다 조회날짜가 작을 때
			if(comparisonResult<0) {
				result = service.increaseCount(b);
				post.setHitsNo(post.getHitsNo()+1);
			}
		}else {
			result = service.increaseCount(b);
			post.setHitsNo(post.getHitsNo()+1);
		}
		
		mav.addObject("attachment", attach);
		mav.addObject("img", img);
		mav.addObject("post", post);
		mav.setViewName("pledge/pledgeDetailView");
		
		return mav;
	}

	

	
	// 게시글 등록하기 페이지 이동
	@GetMapping("/insert")
	public ModelAndView pledgeInsert() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pledge/pledgeInsert");
		
		return mav;
	}
	
	//공지사항 목록페이지 이동
	//'@'PageableDefault' 페이지네이션 관련정보 자동추출)		
	@GetMapping("/board/list")
	public ModelAndView boardNotice(@PageableDefault(size = 10, sort = "boardNo", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam int subCategoryNo,
			@RequestParam(value="page", defaultValue = "0") int page,
			@RequestParam(value="filter", defaultValue="0") String filter,
			@RequestParam(value="searchSelect", required=false) String searchSelect,
			@RequestParam(value="searchValue", required=false) String searchValue) {
		Page<Board> pages = service.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
		System.out.println(pages);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", pages);
		mav.setViewName("board/notice/boardList");
		return mav;
	}

	// 건의게시판 페이지 이동
	@GetMapping("/boardSuggestion")
	public ModelAndView boardSuggestion() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/suggestion/boardList");
		return mav;
	}
	
	//공지사항 상세페이지 이동
	 @GetMapping("/board/detail/{postNo}")
	    public ModelAndView boardDetail(
	    		@PathVariable int postNo, 
	    		@RequestParam(value="subCategoryNo", defaultValue="1")int subCategoryNo) {
		 
//		 	List<Post> board = service.boardDetail(postNo);
	        ModelAndView mav = new ModelAndView();
	        Post board = service.boardDetail(postNo);
	        mav.addObject("b", board);
	        System.out.println("board" + board);
	        mav.setViewName("board/notice/boardDetail");
	        return mav;
	    }
	 
	 
	// 댓글목록 조회
	@GetMapping("/selectCommentList")
	public List<Comment> selectCommentList(Board b){
		System.out.println("실행???");
		List<Comment> commentList = pservice.selectCommentList(b);
		
		System.out.println("commentList"+commentList);
		return commentList;
	}
	
	// 댓글등록
	@PostMapping("/insertComment")
	public int insertComment(Comment c) {
		int result = 0;
		return pservice.insertComment(c);
	}
	
	// 댓글수정
	@PutMapping("/updateComment/{commentNo}")
	public int updateComment( @RequestBody Comment comment ) {
		System.out.println(comment);
		return pservice.updateComment(comment);
	}
	
	// 댓글삭제
	@DeleteMapping("/deleteComment/{commentNo}")
	public int deleteComment(Comment comment) {
		System.out.println(comment);
		return pservice.deleteComment(comment);
	}
}