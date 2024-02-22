package com.kks.trashpedia.encyclopedia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.encyclopedia.model.service.EncyclopediaService;
import com.kks.trashpedia.trash.model.vo.Trash;

@Controller
@RequestMapping("/encyclopedia")
public class EncyclopediaController {

    @Autowired
    private EncyclopediaService encyclopediaService;

    // 쓰레기사전 페이지 이동
    @GetMapping("/trashlist")
    public String showEncyclopediaPage() {
        return "encyclopedia/trashEncyclopedia";
    }



    // 쓰레기사전 세부 페이지 이동
    @GetMapping("/trashDetail")
    public ModelAndView showTrashDetail(@RequestParam(value = "trashId") int trashNo) {
        ModelAndView modelAndView = new ModelAndView();
        // trashNo를 기반으로 해당 쓰레기 정보를 가져옴
        Trash trash = encyclopediaService.getTrashByNo(trashNo);
        modelAndView.addObject("trash", trash);
        modelAndView.setViewName("encyclopedia/trashEncyclopediaDetail");
        return modelAndView;
    }

    @PostMapping("/mainCategory")
    public ModelAndView receiveMainCategory(@RequestParam(value = "mainCategory") String mainCategory) {
        ModelAndView modelAndView = new ModelAndView();
        List<Trash> trashList;
        if (mainCategory != null) {
            // 카테고리 선택시
            trashList = encyclopediaService.getTrashListByCategory(mainCategory);
        } else {
            // Default 5장
            trashList = encyclopediaService.getAllTrashList();
        }
        modelAndView.addObject("trashList", trashList);
        modelAndView.setViewName("encyclopedia/trashEncyclopedia");
        return modelAndView;
    }

    @PostMapping("/subCategory")
    public ModelAndView receiveSubCategory(@RequestParam(value = "subCategory") String subCategory) {
        ModelAndView modelAndView = new ModelAndView();
        List<Trash> trashList;
        if (subCategory != null) {
            // 카테고리 선택시
            trashList = encyclopediaService.getTrashListByCategory(subCategory);
        } else {
            // Default 5장
            trashList = encyclopediaService.getAllTrashList();
        }
        modelAndView.addObject("trashList", trashList);
        modelAndView.setViewName("encyclopedia/trashEncyclopedia");
        return modelAndView;
    }
}
