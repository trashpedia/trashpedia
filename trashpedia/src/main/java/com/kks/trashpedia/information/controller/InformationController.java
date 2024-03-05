package com.kks.trashpedia.information.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.information.model.service.InformationService;
import com.kks.trashpedia.pledge.model.service.PledgeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/information")
public class InformationController {

	@Autowired
	private InformationService service;
	
	@Autowired
	private PledgeService pService;
	
	
	// 정보자료글 페이지 이동
	@GetMapping("/list")
	public ModelAndView showEncyclopediaPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("information/InformationView");
		return mav;
	}

	// 정보자료글 보기 & 페이징,검색
	@GetMapping("/loadListData")
	public ResponseEntity<Page<Post>> loadListData(@RequestParam int subCategoryNo,
			@PageableDefault(size = 9, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam int page, @RequestParam String sort, @RequestParam String searchSelect,
			@RequestParam String searchValue) {

		Page<Post> pages = service.loadListData(pageable, page, sort, searchSelect, searchValue, subCategoryNo);

		System.out.println("information/list controller 실행");
		return ResponseEntity.ok(pages);
	}
	
	// 정보자료글 상세 페이지 이동
	@GetMapping("/detail/{postNo}")
	public ModelAndView pledgeDetail(
			@PathVariable int postNo, HttpServletRequest req, HttpServletResponse res, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		
		// 글내용 조회
		Post post = pService.pledgeDetail(postNo);
		Board b = new Board();

		// 이미지,첨부파일,카테고리
		ImgAttachment img = pService.pledgeDetailImg(post.getBoardNo());
		Attachment attach = pService.pledgeDetailAttach(post.getBoardNo());

		b.setImgAttachment(img);
		b.setAttachment(attach);
		b.setBoardNo(post.getBoardNo());
		b.setUserNo(post.getUserNo());

		int result = 0;

		// 처음 조회일 조회 -> LocalDate로 변환
		Date hitsDate = pService.pledgeHitDate(b);

		// 조회일이 있을 때
		if (hitsDate != null) {
			// 조회날짜와 현재날짜 비교
			LocalDate hitsLocalDate = hitsDate.toLocalDate();
			LocalDate currentDate = LocalDate.now();
			int comparisonResult = hitsLocalDate.compareTo(currentDate); // 적으면 -, 같으면 0, 많으면 +값
			// 현재날짜보다 조회날짜가 작을 때
			if (comparisonResult < 0) {
				result = pService.increaseCount(b);
				post.setHitsNo(post.getHitsNo() + 1);
			}
		} else {
			result = pService.increaseCount(b);
			post.setHitsNo(post.getHitsNo() + 1);
		}

		mav.addObject("attachment", attach);
		mav.addObject("img", img);
		mav.addObject("post", post);
		mav.setViewName("information/InformationDetailView");

		return mav;
	}
	
	// 댓글목록 조회
	@GetMapping("/selectCommentList")
	public List<Comment> selectCommentList(Board b){
		List<Comment> commentList = pService.selectCommentList(b);
		return commentList;
	}
	
	
	
}
