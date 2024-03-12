package com.kks.trashpedia.pledge.controller;

import java.util.List;

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

import com.kks.trashpedia.GetClientIpAddress;
import com.kks.trashpedia.board.model.service.BoardService;
import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.Comment;
import com.kks.trashpedia.board.model.vo.Hits;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.member.model.vo.Member;
import com.kks.trashpedia.pledge.model.service.PledgeService;
import com.kks.trashpedia.pledge.model.vo.Signature;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/pledge")
public class PledgeController {
	
	private final PledgeService service;
	private final BoardService boardService;

	//실천서약 페이지 이동
	@GetMapping("/list")
	public ModelAndView pledgeList(int subCategoryNo) {
		
		ModelAndView mav = new ModelAndView();
		
		int countSignature= service.countSignature();
		
		mav.addObject("countSignature", countSignature);
		mav.setViewName("pledge/pledgeView");
		return mav;
	}
	
	
	//페이지 보기 & 페이징,검색
	@GetMapping("/loadListData")
	public ResponseEntity<Page<Post>> loadListData( 
			@RequestParam int subCategoryNo,
			@PageableDefault(size=8, sort="id", direction=Sort.Direction.DESC) Pageable pageable,
			@RequestParam int page,
			@RequestParam String sort,
			@RequestParam String searchSelect,
			@RequestParam String searchValue){
		
		Page<Post> pages = service.loadListData(pageable,page,sort,searchSelect,searchValue,subCategoryNo);
		return ResponseEntity.ok(pages);
	}
			
	
	// 게시글 수정 페이지 이동
	@GetMapping("/modify")
	public ModelAndView pledgeModify() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pledge/pledgeModify");
		
		return mav;
	}
	
	//실천 상세 페이지 이동
	@GetMapping("/detail/{postNo}")
	public ModelAndView pledgeDetail(
			@PathVariable int postNo,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session
			) {
		
		ModelAndView mav = new ModelAndView();
		
		//글내용 조회
		Post post = service.pledgeDetail(postNo); 
		Board b = new Board();
		
		//이미지,첨부파일,카테고리
		ImgAttachment img = service.pledgeDetailImg(post.getBoardNo());
		Attachment attach = service.pledgeDetailAttach(post.getBoardNo());
		
		b.setImgAttachment(img);
		b.setAttachment(attach);
			
		b.setBoardNo(post.getBoardNo());
		
		String ip = GetClientIpAddress.getClientIpAddress(req);
		Hits hits = new Hits();
		hits.setUserIp(ip);
		hits.setBoardNo(post.getBoardNo());
		
		boardService.increaseCount(hits);
			
		mav.addObject("attachment", attach);
		mav.addObject("img", img);
		mav.addObject("post", post);
		
		if(post.getSubCategoryNo()==5) {
			mav.setViewName("pledge/pledgeCDetailView");
		}else {
			mav.setViewName("pledge/pledgeDetailView");
		}
		return mav;
	}
	
	
	// 게시글 삭제
	@GetMapping("/delete/{postNo}")
	public ModelAndView pledgeDelete(Post p, HttpSession session, RedirectAttributes ra) {

		ModelAndView mav = new ModelAndView();
		SubCategory subCategory = service.getCategoryNo(p);
		
		int subCategoryNo = subCategory.getSubCategoryNo();
		int bigCategoryNo = subCategory.getBigCategoryNo();
		
		//게시글삭제- post & board
		int result1 = service.pledgeDeletePost(p);
		int result2 = service.pledgeDeleteBoard(p);
		
		if(result1*result2>0) {
			ra.addFlashAttribute("alert", "게시글이 삭제되었습니다.");
		}else {
			ra.addFlashAttribute("alert", "게시글 삭제에 실패했습니다.");
		}

		mav.setViewName("redirect:/pledge/list?bigCategoryNo="+bigCategoryNo+"&subCategoryNo="+subCategoryNo);
		
		return mav;
		
	}
	
	// 댓글목록 조회
	@GetMapping("/selectCommentList")
	public List<Comment> selectCommentList(Board b){
		List<Comment> commentList = service.selectCommentList(b);
		return commentList;
	}
	
	// 댓글등록
	@PostMapping("/insertComment")
	public int insertComment(Comment c) {
		return service.insertComment(c);
	}
	
	// 댓글수정
	@PutMapping("/updateComment/{commentNo}")
	public int updateComment( @RequestBody Comment comment ) {
		return service.updateComment(comment);
	}
	
	// 댓글삭제
	@DeleteMapping("/deleteComment/{commentNo}")
	public int deleteComment(Comment comment) {
		return service.deleteComment(comment);
	}
	
	// 실천서약등록
	@PostMapping("/insertSignature")
	public int insertSignature(Signature signature, Member signatureMember) {
		return service.insertSignature(signature, signatureMember);
	}
	
	// 실천서약조회
	@GetMapping("/selectSignatureList")
	public List<Signature> selectSignatureList(int pledgeNo ){
		return service.selectSignatureList(pledgeNo);
	}
	
	

	
	
	
}