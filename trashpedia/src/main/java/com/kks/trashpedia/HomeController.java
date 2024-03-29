package com.kks.trashpedia;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.information.model.service.InformationService;
import com.kks.trashpedia.pledge.model.service.PledgeService;
import com.kks.trashpedia.trash.model.service.TrashService;
import com.kks.trashpedia.trash.model.vo.TrashPost;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class HomeController {
  
	private final TrashService trashService;
	private final PledgeService pledgeService;
	private final InformationService informationService;
	
	@GetMapping("/")
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		// 최근 업데이트된 쓰레기
		List<TrashPost> recentlyTrashList = trashService.getRecentlyTrashList(); 
		mav.addObject("recentlyTrashList", recentlyTrashList);
		
		// 정보자료글
		List<Post> informationList = informationService.getinformationList(7);
		mav.addObject("informationList",informationList);
		
		// 실천서약
		List<Post> pledgeCList = pledgeService.pledgeList(5);
		mav.addObject("pledgeCList",pledgeCList);
		
		// 실천인증
		List<Post> pledgeList = pledgeService.pledgeList(6);
		mav.addObject("pledgeList",pledgeList);

		mav.setViewName("main");
		return mav;
	}
}