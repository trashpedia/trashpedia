package com.kks.trashpedia.trash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.trash.model.service.TrashService;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
import com.kks.trashpedia.trash.model.vo.TrashPost;
import com.kks.trashpedia.trash.model.vo.TrashSubCategory;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/trash")
@RequiredArgsConstructor
public class TrashController {
	
	private final TrashService service;
	

	// 쓰레기사전 페이지 이동
	@GetMapping("/list")
	public ModelAndView showEncyclopediaPage() {
		ModelAndView modelAndView = new ModelAndView();
		//모든쓰레기 조회
		
		//최근 업데이트된 쓰레기
		List<TrashPost> trashList = service.getRecentlyTrashList(); 
		
		//인기쓰레기
		List<TrashPost> popularList = service.getPopularList();
		
//		log.info(" trash controller: {}", popularList);
		
		modelAndView.addObject("trashList", trashList);
		modelAndView.addObject("popularList", popularList);
		modelAndView.setViewName("encyclopedia/trashEncyclopedia");
		return modelAndView;
	}
	
	
	//쓰레기 상세페이지이동
	@GetMapping("/detail")
	public ModelAndView trashDetail(@RequestParam int trashNo) {
		ModelAndView modelAndView = new ModelAndView();
		
		Trash trash = service.trashDetail(trashNo);
		List<TrashPost> similarList = service.getSimilarList(trashNo);
		
		
		
		modelAndView.addObject("similarList", similarList);
		modelAndView.addObject("trash", trash);
		modelAndView.addObject("type", "read");
		modelAndView.setViewName("encyclopedia/trashEncyclopediaDetail");
		return modelAndView;
	}
	
	@GetMapping("/allList")
	public ModelAndView allTrashList() {
		ModelAndView mav = new ModelAndView();
		
		List<TrashBigCategory> bigCategoryList = service.getBigCategoryList();
		List<TrashSubCategory> subCategoryList = service.getSubCategoryList();
		List<Trash> trash = service.getAllTrashList();
		
		mav.addObject("bigCategory",bigCategoryList);
		mav.addObject("subCategory",subCategoryList);
		mav.addObject("trash",trash);
		
		System.out.println(trash);
		System.out.println(subCategoryList);
		mav.setViewName("encyclopedia/trashEncyclopediaResult");
		return mav;
	}
	
	@GetMapping("/write")
	public ModelAndView writeTrashPage() {
		ModelAndView mav = new ModelAndView("encyclopedia/trashEncyclopediaDetail");
		
		List<TrashBigCategory> bigCategoryList = service.getBigCategoryList();
		mav.addObject("type","insert");
		mav.addObject("bigCategory", bigCategoryList);
		return mav;
	}
	
	@GetMapping("/getSubcategoryList")
	public ResponseEntity<List<TrashSubCategory>> getSubcategoryList(int bigCategoryNo) {
		List<TrashSubCategory> list = service.getSubCategoryList(bigCategoryNo);
		return ResponseEntity.ok(list);
	}
	
	@PostMapping("/write")
	public ModelAndView writeTrash(TrashSubCategory tsc, TrashPost tp, @RequestParam("thumbnail") MultipartFile thumbnailImage) {
		ModelAndView mv = new ModelAndView();
		int result = service.writeTrash(tp, tsc);
//
//		b.setPostNo(postNo);
//		b.setSubCategoryNo(subcategory.getSubCategoryNo());
//		
//		// board 등록
//		if (postNo > 0) {
//			
//			int boardNo = service.createBoard(b);
//			if (boardNo > 0) { 		
//				// 첨부파일, 이미지 파일 저장
//				Attachment attachment = fileStore.storeFile(upfile);
//				ImgAttachment image = fileStore.storeImage(thumbnailImage);
//
//				if (attachment != null) {
//					attachment.setRefBno(boardNo);
//					attachment.setFileType(type);
//				}
//				if (image != null) {
//					image.setRefBno(boardNo);
//					image.setImgType(type);
//				}
//				service.insertFiles(attachment, image);
//				ra.addFlashAttribute("alert", "게시글이 작성되었습니다.");
//			} else {
//				ra.addFlashAttribute("alert", "게시글 작성에 실패하셨습니다.");
//			}
//		} else {
//			ra.addFlashAttribute("alert", "게시글 작성에 실패하셨습니다.");
//		}
//
//		String nextUrl = (String) session.getAttribute("lastUrl");
//		mv.setViewName("redirect:/");
//
//		if (nextUrl != null) {
//			// 첫 번째 path segment만 추출
//			UriComponentsBuilder builder = UriComponentsBuilder.fromUriString(nextUrl);
//			String firstPathSegment = builder.build().getPathSegments().get(0);
//
//			mv.setViewName("redirect:" + "/" + firstPathSegment + "/list?bigCategoryNo=" + p.getBigCategoryNo()
//					+ "&subCategoryNo=" + p.getSubCategoryNo());
//		}
		return mv;
	};
}