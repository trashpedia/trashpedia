package com.kks.trashpedia.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.kks.trashpedia.admin.model.service.adminService;

@RestController
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private adminService service;
	
	@GetMapping("")
	public ModelAndView adminMain() {
		
		int allMember = service.allMember();
		int allBoard = service.allBoard();
		int newMember = service.newMember();
		int oldMember = service.oldMember();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminMain");
		mav.addObject("allMember", allMember);
		mav.addObject("allBoard", allBoard);
		mav.addObject("newMember", newMember);
		mav.addObject("oldMember", oldMember);
		return mav;
	}
	
	@GetMapping("/getMemberData")
	public String getMemberData() {
        List<Map<String, Object>> chartData = service.getMemberData();
        StringBuilder json = new StringBuilder();
        json.append("[");
        for (Map<String, Object> data : chartData) {
            json.append("{");
            for (Map.Entry<String, Object> entry : data.entrySet()) {
                json.append("'").append(entry.getKey()).append("': '").append(entry.getValue()).append("', ");
            }
            json.deleteCharAt(json.length() - 2);
            json.append("}, ");
        }
        json.deleteCharAt(json.length() - 2);
        json.append("]");
        return json.toString();
    }
	
	@GetMapping("/login")
	public ModelAndView adminLogin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminLogin");
		return mav;
	}
	
	@GetMapping("/board")
	public ModelAndView boardManagement() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/boardManagement");
		return mav;
	}
	
	@GetMapping("/member")
	public ModelAndView memberManagement() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/memberManagement");
		return mav;
	}
	
	@GetMapping("/trash")
	public ModelAndView trashManagement() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/trashManagement");
		return mav;
	}
	
	@GetMapping("/{boardId}")
	public String boardId(@PathVariable String boardId) {
		return boardId + "admin";
	}
	
	@GetMapping("/update")
	public String boardUpdate(@RequestParam String boardId) {
		return boardId + "update";
		// localhost:8085/trashpedia/update?boardId=3
		// boardId에 3 값을 가져옴
	}
}
