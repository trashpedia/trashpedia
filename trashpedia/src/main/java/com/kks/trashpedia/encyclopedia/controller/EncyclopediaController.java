package com.kks.trashpedia.encyclopedia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kks.trashpedia.encyclopedia.model.service.EncyclopediaService;
import com.kks.trashpedia.trash.model.vo.Trash;



@Controller
public class EncyclopediaController {

	@Autowired
	private EncyclopediaService encyclopediaService;
	
	//쓰레기사전 페이지 이동
    @GetMapping("/trashlist")
    public String showEncyclopediaPage(Model model, @RequestParam(value = "category", required = false) String category) {
        List<Trash> trashList;
        if (category != null) {
        	// 카테고리 선택시
            trashList = encyclopediaService.getTrashListByCategory(category);
        } else {
            // Default 5장
            trashList = encyclopediaService.getAllTrashList();
        }
        model.addAttribute("trashList", trashList);
        return "encyclopedia/trashEncyclopedia";
    }
	
}
