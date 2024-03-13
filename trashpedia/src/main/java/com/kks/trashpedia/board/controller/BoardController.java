package com.kks.trashpedia.board.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kks.trashpedia.GetClientIpAddress;
import com.kks.trashpedia.board.model.service.BoardService;
import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Hits;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.NestedComment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.pledge.model.service.PledgeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

	private final BoardService service;
	private final PledgeService pservice;

	// 게시판 메인페이지 이동
	@GetMapping("")
	public ModelAndView boardMain() {
		List<BigCategory> bc = service.allBigCategory();
		List<SubCategory> sc = service.allSubCategory();
		List<Board> board = service.allBoardList();
		ModelAndView mav = new ModelAndView();

		mav.addObject("bc", bc);
		mav.addObject("sc", sc);
		mav.addObject("board", board);

		mav.setViewName("board/boardMain");
		return mav;
	}

	// 검색 기능
	@GetMapping("/searchByTitle")
	public ModelAndView searchByTitle(@RequestParam String title) {
		ModelAndView mav = new ModelAndView();
		Post post = service.getPostByTitle(title);
		if (post != null) {
			mav.setViewName("pledge/pledgeDetailView");
		} else {
			mav.setViewName("errorPage");
		}
		return mav;
	}

	@GetMapping("/delete/{postNo}")
	public ModelAndView boardDelete(Post p, HttpSession session, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		SubCategory subCategory = service.getSubCategoryNo(p);

		int subCategoryNo = subCategory.getSubCategoryNo();
		int result = service.deleteBoard(p);

		if (result > 0) {
			ra.addFlashAttribute("alert", "게시글이 삭제되었습니다.");
		} else {
			ra.addFlashAttribute("alert", "게시글 삭제에 실패했습니다.");
		}
		mav.setViewName("redirect:/board/list?subCategoryNo=" + subCategoryNo);
		return mav;
	}

	// 게시글 상세 페이지 이동
	@GetMapping("/detail/{boardNo}")
	public ModelAndView boardFreeShareDetail(@PathVariable int boardNo, HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();
		Board board = service.boardDetail(boardNo);

		// 이미지,첨부파일,카테고리
		ImgAttachment img = service.getImageUrl(board.getBoardNo(), 1);
		Attachment attach = service.getDetailAttach(board.getBoardNo(), 1);

		board.setImgAttachment(img);
		board.setAttachment(attach);
		
		String ip = GetClientIpAddress.getClientIpAddress(req);
		Hits hits = new Hits();
		hits.setUserIp(ip);
		hits.setBoardNo(board.getBoardNo());
			
		service.increaseCount(hits);

		mav.addObject("b", board);
		mav.addObject("attachment", attach);
		mav.addObject("img", img);
		mav.setViewName("board/notice/boardDetail");

		return mav;
	}

	// 게시글 등록하기 페이지 이동
	@GetMapping("/insert")
	public ModelAndView boardInsert() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("common/boardInsert");
		return mav;
	}

	// 공지사항 목록페이지 이동
	@GetMapping("/list")
	public ModelAndView boardList(
			@PageableDefault(size = 10, sort = "boardNo", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam int subCategoryNo, @RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "filter", defaultValue = "0") String filter,
			@RequestParam(value = "searchSelect", required = false) String searchSelect,
			@RequestParam(value = "searchValue", required = false) String searchValue) {
		ModelAndView mav = new ModelAndView();
		Page<Board> pages = service.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
		mav.addObject("boardList", pages);
//		if (subCategoryNo == 4) {
//			Pageable freeSharePageable = PageRequest.of(pageable.getPageNumber(), 12, pageable.getSort());
//			Page<Board> freeSharePages = service.boardList(subCategoryNo, freeSharePageable, page, filter, searchSelect, searchValue);
//
//			List<Board> content = freeSharePages.getContent();
//			for (Board board : content) {
//				String cleanedContent = board.getContent().replaceAll("<img[^>]*>", "");
//				board.setContent(cleanedContent);
//			}
//		    freeSharePages = new PageImpl<>(content, freeSharePages.getPageable(), freeSharePages.getTotalElements());
//			mav.addObject("boardList", freeSharePages);
//			mav.setViewName("board/freeShare/freeShare");
//		} else {
//		}
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

	// 댓글목록 조회
	@GetMapping("/selectCommentList")
	public List<Comment> selectCommentList(Board b) {
		List<Comment> commentList = pservice.selectCommentList(b);
		return commentList;
	}

	// 댓글등록
	@PostMapping("/insertComment")
	public int insertComment(Comment c) {
		return pservice.insertComment(c);
	}

	// 댓글수정
	@PutMapping("/updateComment/{commentNo}")
	public int updateComment(@RequestBody Comment comment) {
		return pservice.updateComment(comment);
	}

	// 댓글삭제
	@DeleteMapping("/deleteComment/{commentNo}")
	public int deleteComment(Comment comment) {
		return pservice.deleteComment(comment);
	}

	@PostMapping("/insertNC")
	public ResponseEntity<Integer> insertNC(@RequestBody NestedComment nc) {
		int result = service.insertNC(nc);
		return ResponseEntity.ok(result);
	}

	// 대댓글조회
	@GetMapping("/viewNC/{commentNo}")
	public List<NestedComment> viewNC(@PathVariable("commentNo") int commentNo, Board b) {
		List<NestedComment> NCList = service.viewNC(commentNo);
		return NCList;
	}

	// 대댓글삭제
	@DeleteMapping("/deleteNC/{nCommentNo}")
	public int deleteNC(@PathVariable("nCommentNo") int nCommentNo) {
		return service.deleteNC(nCommentNo);
	}
	
	// 대댓글 수정
	@PostMapping("/updateNC/{nestedCommentNo}")
	public int updateNC(NestedComment nestedComment) {
		return service.updateNC(nestedComment);
	}
	

	// 회원의 댓글작성시 point를 증가시키는 함수
	@PostMapping("/increaseUserPoint")
	public ResponseEntity<Integer> increaseUserPoint(@RequestParam int userNo, @RequestParam int amount,
			@RequestParam String pointContent) {
		int result = service.increaseUserPoint(userNo, amount, pointContent);
		return ResponseEntity.ok(result);
	}
}