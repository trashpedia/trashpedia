package com.kks.trashpedia.trash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.trash.model.service.TrashService;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashPost;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/trash")
public class TrashController {
	
	@Autowired
	private TrashService service;
	

	// 쓰레기사전 페이지 이동
	@GetMapping("/list")
	public ModelAndView showEncyclopediaPage() {
		ModelAndView modelAndView = new ModelAndView();
		
		//최근 업데이트된 쓰레기
		List<TrashPost> trashList = service.getRecentlyTrashList(); 
		
		//인기쓰레기
		List<TrashPost> popularList = service.getPopularList();
		
		System.out.println(trashList);
		modelAndView.addObject("trashList", trashList);
		modelAndView.addObject("popularList", popularList);
		modelAndView.setViewName("encyclopedia/trashEncyclopedia");
		return modelAndView;
	}
	
	
	//쓰레기 상세페이지이동
	@GetMapping("/detail/{trashPostNo}")
	public ModelAndView trashDetail(
			@PathVariable int trashPostNo,
			HttpServletRequest req,
			HttpServletResponse res,
			HttpSession session
			) {
		ModelAndView modelAndView = new ModelAndView();
		
		//쓰레기 내용 조회
		TrashPost tPost = service.trashDetail(trashPostNo);
		Trash t = new Trash();
		System.out.println(tPost);
		
		//쓰레기 이미지, 제목, 설명, 대분류, 소분류
		//ImgAttachment img = service.trashDetailImg(tPost.getTrashPostNo());
	
//		t.setImgAttachment(img);
		modelAndView.addObject("tPost", tPost);
		modelAndView.setViewName("encyclopedia/trashEncyclopediaDetail");
		return modelAndView;
	}
}