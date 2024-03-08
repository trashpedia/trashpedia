package com.kks.trashpedia.trash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.trash.model.service.TrashService;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashBigCategory;
import com.kks.trashpedia.trash.model.vo.TrashPost;
import com.kks.trashpedia.trash.model.vo.TrashSubCategory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/trash")
public class TrashController {
	
	@Autowired
	private TrashService service;
	

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
		
		System.out.println(bigCategoryList);
		System.out.println(subCategoryList);
		System.out.println(trash);
		
		mav.setViewName("encyclopedia/trashEncyclopediaResult");
		return mav;
	}
}