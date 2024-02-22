package com.kks.trashpedia.encyclopedia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.Image;
import com.kks.trashpedia.encyclopedia.model.service.EncyclopediaService;
import com.kks.trashpedia.trash.model.vo.Trash;
import com.kks.trashpedia.trash.model.vo.TrashPost;


@Controller
@RequestMapping("")
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
    public ModelAndView showTrashDetail(@RequestParam(value = "trashNo") int trashNo) {
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
        
        // 이미지 주소와 쓰레기 내용 가져오기	
        for (Trash trash : trashList) {
            String imageUrl = encyclopediaService.getImageUrlByTrashNo(trash.getTrashNo());
            Image image = new Image();
            image.setOriginName(imageUrl);

            String trashContent = encyclopediaService.getTrashContentByTrashNo(trash.getTrashNo());
            TrashPost trashPost = new TrashPost();
            trashPost.setTrashContent(trashContent);

            // 이후에 Image나 TrashPost 객체를 어떻게 사용할지에 대한 코드를 작성합니다.
            // 예를 들어, 어떤 자료구조에 담거나, 다른 처리를 하거나, 화면에 표시하는 등의 작업을 수행할 수 있습니다.
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
        
        // 이미지 주소와 쓰레기 내용 가져오기
        for (Trash trash : trashList) {
            String imageUrl = encyclopediaService.getImageUrlByTrashNo(trash.getTrashNo());
            Image image = new Image();
            image.setOriginName(imageUrl);

            String trashContent = encyclopediaService.getTrashContentByTrashNo(trash.getTrashNo());
            TrashPost trashPost = new TrashPost();
            trashPost.setTrashContent(trashContent);

            // 이후에 Image나 TrashPost 객체를 어떻게 사용할지에 대한 코드를 작성합니다.
            // 예를 들어, 어떤 자료구조에 담거나, 다른 처리를 하거나, 화면에 표시하는 등의 작업을 수행할 수 있습니다.
        }

        modelAndView.addObject("trashList", trashList);
        modelAndView.setViewName("encyclopedia/trashEncyclopedia");
        return modelAndView;
    }

}
