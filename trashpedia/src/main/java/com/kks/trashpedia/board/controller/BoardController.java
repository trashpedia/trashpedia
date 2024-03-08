package com.kks.trashpedia.board.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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

import com.kks.trashpedia.board.model.service.BoardService;
import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.BigCategory;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.NestedComment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.pledge.model.service.PledgeService;

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
		
		mav.addObject("bc", bc);
		mav.addObject("sc", sc);
		mav.addObject("post", post);
		
		mav.setViewName("board/boardMain");
		return mav;
	}

	// 게시글 수정 페이지 이동
	@GetMapping("/modify")
	public ModelAndView pledgeModify() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/notice/boardModify");
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
	
	@GetMapping("/delete/{postNo}")
	public ModelAndView boardDelete(Post p, HttpSession session, RedirectAttributes ra,
			@PathVariable int postNo
			) {
		ModelAndView mav = new ModelAndView();
		SubCategory subCategory = pservice.getCategoryNo(p);
		
		int subCategoryNo = subCategory.getSubCategoryNo();
		int bigCategoryNo = subCategory.getBigCategoryNo();
		
		//게시글삭제- post & board
//		int result = 0;
		int result1 = pservice.pledgeDeletePost(p);
		int result2 = pservice.pledgeDeleteBoard(p);
		
		if(result1*result2>0) {
			ra.addFlashAttribute("alert", "게시글이 삭제되었습니다.");
		}else {
			ra.addFlashAttribute("alert", "게시글 삭제에 실패했습니다.");
		}

		mav.setViewName("redirect:/pledge/list?bigCategoryNo="+bigCategoryNo+"&subCategoryNo="+subCategoryNo);
		
		return mav;
	}

	
	// 게시글 상세 페이지 이동
	@GetMapping("/detail/{postNo}")
	public ModelAndView boardFreeShareDetail(@PathVariable int postNo, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {

		ModelAndView mav = new ModelAndView();
		// 글내용 조회
		Post post = service.getFreeTrashDetail(postNo);
		Board b = new Board();

		// 이미지,첨부파일,카테고리
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
		if (hitsDate != null) {
			// 조회날짜와 현재날짜 비교
			LocalDate hitsLocalDate = hitsDate.toLocalDate();
			LocalDate currentDate = LocalDate.now();
			int comparisonResult = hitsLocalDate.compareTo(currentDate); // 적으면 -, 같으면 0, 많으면 +값
			// 현재날짜보다 조회날짜가 작을 때
			if (comparisonResult < 0) {
				result = service.increaseCount(b);
				post.setHitsNo(post.getHitsNo() + 1);
			}
		} else {
			result = service.increaseCount(b);
			post.setHitsNo(post.getHitsNo() + 1);
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

	// 공지사항 목록페이지 이동
	@GetMapping("/list")
	public ModelAndView boardNotice(
			@PageableDefault(size = 10, sort = "boardNo", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam int subCategoryNo, @RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "filter", defaultValue = "0") String filter,
			@RequestParam(value = "searchSelect", required = false) String searchSelect,
			@RequestParam(value = "searchValue", required = false) String searchValue) {
		List<BigCategory> bc = service.bigCategory();
		List<SubCategory> sc = service.subCategory();
//		Page<Board> pages = service.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
		Page<Board> freeSharePages = service.boardList(subCategoryNo, pageable, page, filter, searchSelect, searchValue);
		Board b = new Board();
		
		
		ModelAndView mav = new ModelAndView();

		if (subCategoryNo == 4) { // 무료 나눔 게시판
	        List<Post> boardFreeTrashList = service.getFreeTrashList(subCategoryNo,pageable,page); // 인기 쓰레기 정보 가져오기

	        int pageSize = 12; // 페이지당 보여줄 항목 수
	        int totalPages = (int) Math.ceil((double) boardFreeTrashList.size() / pageSize); 

	        // 페이지 번호 및 데이터 전달
	        mav.addObject("pageSize", pageSize); // 페이지당 보여줄 항목 수
	        mav.addObject("totalPages", totalPages); // 총페이지
	        mav.addObject("list", boardFreeTrashList); // 페이지에 표시할 데이터
			mav.addObject("bigCategoryNo", bc);
			mav.addObject("subCategoryNo", sc);
	        mav.setViewName("board/freeShare/freeShare"); // 무료 나눔 게시판 뷰 설정
	    } 
//		else {
//	    	int pageSize = 10;
//	        int totalPages = (int) Math.ceil((double) pages.getSize() / pageSize); // 전체 페이지 수 계산
//			mav.addObject("boardList", pages);
//			mav.addObject("totalPages",totalPages);
//			mav.addObject("bigCategoryNo", bc);
//			mav.addObject("subCategoryNo", sc);
//			mav.setViewName("board/notice/boardList");
//		}
		return mav;
	}
	
	
	//페이지 보기 & 페이징,검색
	@GetMapping("/loadListData")
	public ResponseEntity<Page<Post>> loadListData( 
			@RequestParam int subCategoryNo,
			@PageableDefault(size=12, sort="id", direction=Sort.Direction.DESC) Pageable pageable,
			@RequestParam int page,
			@RequestParam String sort,
			@RequestParam String searchSelect,
			@RequestParam String searchValue){
		
		Page<Post> pages = service.loadListData(pageable,page,sort,searchSelect,searchValue,subCategoryNo);
		
		return ResponseEntity.ok(pages);
	}

	// 건의게시판 페이지 이동
	@GetMapping("/boardSuggestion")
	public ModelAndView boardSuggestion() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/suggestion/boardList");
		return mav;
	}
	
	//커뮤니티 상세페이지 이동
	 @GetMapping("community/detail/{postNo}")
	    public ModelAndView boardDetail(
	    		@PathVariable int postNo, 
	    		@RequestParam(value="subCategoryNo", defaultValue="1")int subCategoryNo) {
		 
//		 	List<Post> board = service.boardDetail(postNo);
		ModelAndView mav = new ModelAndView();
		Post board = service.boardDetail(postNo);
		mav.addObject("b", board);
		mav.setViewName("board/notice/boardDetail");
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
		int result = 0;
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
	
	
	//대댓글등록
//	@PostMapping("/insertNC")
//	public int insertNC(NestedComment nc,
//			@RequestParam String content,
//			@RequestParam int userNo,
//			@RequestParam int commentNo
//			) {
//		int result = service.insertNC(nc);
//		return result;
//	}
	
	@PostMapping("/insertNC")
	public ResponseEntity<Integer> insertNC(@RequestBody NestedComment nc) {
	    int result = service.insertNC(nc);
	    return ResponseEntity.ok(result);
	}

	
	
	
	//대댓글조회
	@GetMapping("/viewNC/{commentNo}")
	public List<NestedComment> viewNC( @PathVariable("commentNo") int commentNo, Board b) {
	    List<NestedComment> NCList = service.viewNC(commentNo);
	    return NCList; 
	}
	
	//대댓글삭제
	@DeleteMapping("/deleteNC/{nCommentNo}")
	public int deleteNC(@PathVariable("nCommentNo")int nCommentNo) {
		return service.deleteNC(nCommentNo);
	}
	
}