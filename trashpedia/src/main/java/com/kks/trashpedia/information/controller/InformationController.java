package com.kks.trashpedia.information.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kks.trashpedia.GetClientIpAddress;
import com.kks.trashpedia.board.model.service.BoardService;
import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Hits;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
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
	
	@Autowired
	private BoardService boardService;
	
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

		String ip = GetClientIpAddress.getClientIpAddress(req);
		Hits hits = new Hits();
		hits.setUserIp(ip);
		hits.setBoardNo(post.getBoardNo());
		
		boardService.increaseCount(hits);
		
		mav.addObject("attachment", attach);
		mav.addObject("img", img);
		mav.addObject("post", post);
		mav.setViewName("information/InformationDetailView");

		return mav;
	}
	
	//게시글삭제
	@GetMapping("/delete/{postNo}")
	public ModelAndView pledgeDelete(Post p, HttpSession session, RedirectAttributes ra) {

		ModelAndView mav = new ModelAndView();
		SubCategory subCategory = pService.getCategoryNo(p);
		
		int subCategoryNo = subCategory.getSubCategoryNo();
		
		int result1 = pService.pledgeDeletePost(p);
		int result2 = pService.pledgeDeleteBoard(p);
		
		if(result1*result2>0) {
			ra.addFlashAttribute("alert", "게시글이 삭제되었습니다.");
		}else {
			ra.addFlashAttribute("alert", "게시글 삭제에 실패했습니다.");
		}

		mav.setViewName("redirect:/information/list?&subCategoryNo="+subCategoryNo);
		
		return mav;
		
	}
	
	// 댓글목록 조회
	@GetMapping("/selectCommentList")
	public List<Comment> selectCommentList(Board b){
		List<Comment> commentList = pService.selectCommentList(b);
		return commentList;
	}
}
