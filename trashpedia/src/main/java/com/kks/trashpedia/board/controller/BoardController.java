package com.kks.trashpedia.board.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.Image;
import com.kks.trashpedia.board.model.service.BoardService;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashPost;

@RestController
public class BoardController {
	
	@Autowired
	private BoardService service;

	//게시판 메인페이지 이동
	@GetMapping("/board")
	public ModelAndView boardMain() {
		List<BigCategory> bc = service.bigCategory();
		List<SubCategory> sc = service.subCategory();
		List<Post> post = service.categoryList();
		ModelAndView mav = new ModelAndView();
		System.out.println("subCategory : "+ sc);
		System.out.println("post : "+post);
		mav.addObject("bc",bc);
		mav.addObject("sc",sc);
		mav.addObject("post",post);
		mav.setViewName("board/boardMain");
		return mav;
	}
	
	//정보자료글 페이지 이동
	@GetMapping("/boardInformation")
	public ModelAndView boardInformation() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/information/informationList");
		return mav;
	}
	
	// 무료나눔 상세페이지 이동
			@GetMapping("/boardFreeShare/{trashNo}")
			public ModelAndView boardFreeShareDetail(int trashNo) {
				ModelAndView mav = new ModelAndView();

				// 무료나눔 상세정보를 가져오는 서비스 메서드를 호출하여 해당 쓰레기 번호에 대한 정보를 가져옵니다.
				Trash trash = service.getFreeTrashDetail(trashNo);
				// 타이틀
				String trashTitle = service.getTrashTitleByTrashNo(trash.getTrashNo());
				TrashPost trashPost = new TrashPost();
				trashPost.setTrashTitle(trashTitle);
				// trashNo
				// 글쓴이
				String trashWriter=service.getTrashWriterByTrashNo(trash.getTrashNo());
				// 작성일
				String trashCreate=service.getTrashCreateByTrashNo(trash.getTrashNo());
				// 조회수
				Date trashViews=service.getTrashViewsByTrashNo(trash.getTrashNo());
				//이미지
				String imageUrl = service.getImageUrlByTrashNo(trash.getTrashNo());
				Image image = new Image();  
				image.setOriginName(imageUrl);
				// 내용
				String trashContent = service.getTrashContentByTrashNo(trash.getTrashNo()); // 해당 쓰레기 번호에 따른 쓰레기 정보
				
				//댓글

				
			    // 가져온 정보를 뷰에 전달합니다.
			    mav.addObject("trash", trash);
			    mav.addObject("trashWriter", trashWriter);
			    mav.addObject("trashCreate", trashCreate);
			    mav.addObject("trashViews", trashViews);
			    mav.addObject("imageUrl", imageUrl);
			    mav.addObject("trashContent", trashContent);

				// 뷰의 경로를 설정합니다.
				mav.setViewName("board/freeShare/freeShareDetail");
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
	@GetMapping("/boardList")
	public ModelAndView boardNotice(@PageableDefault(size = 15, sort = "boardNo", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam int subCategoryNo,
			@RequestParam int page,
			@RequestParam String filter,
			@RequestParam String searchSelect,
			@RequestParam String searchValue) {
		Page<Board> pages = service.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", pages);
		System.out.println("boardList"+pages);
		mav.setViewName("board/notice/boardList");
		return mav;
	}
	
	//건의게시판 페이지 이동
	@GetMapping("/boardSuggestion")
	public ModelAndView boardSuggestion() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/suggestion/boardList");
		return mav;
	}
	
	//공지사항 상세페이지 이동
	 @GetMapping("/boardDetail/{postNo}")
	    public ModelAndView boardDetail(@PathVariable int postNo) {
	        ModelAndView mav = new ModelAndView();
	        Post board = service.boardDetail(postNo);
	        mav.addObject("board", board);
	        System.out.println("board" + board);
	        mav.setViewName("board/notice/boardDetail");
	        return mav;
	    }
	 
	 
	 
	
	

	
	
}