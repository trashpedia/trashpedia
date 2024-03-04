package com.kks.trashpedia.trash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.trash.model.service.TrashService;
import com.kks.trashpedia.trash.model.vo.TrashPost;

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
}