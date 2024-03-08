package com.kks.trashpedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.trash.model.service.TrashService;
import com.kks.trashpedia.trash.model.vo.TrashPost;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {
	
//	@GetMapping("/")
//	public String home() {
//		return "main";
//	}
	
	@Autowired
	private  TrashService trashService;
	
	@GetMapping("/")
	public ModelAndView home() {
		
		ModelAndView mav = new ModelAndView();
		
		//최근 업데이트된 쓰레기
		List<TrashPost> recentlyTrashList = trashService.getRecentlyTrashList(); 
		mav.addObject("recentlyTrashList", recentlyTrashList);
		
		log.info("{}",recentlyTrashList);
		
		mav.setViewName("main");
		return mav;
	}
	
	
	
	
	
}
