package com.kks.trashpedia.common.controller;

import java.io.IOException;
import java.net.MalformedURLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kks.trashpedia.board.model.vo.Attachment;
import com.kks.trashpedia.board.model.vo.Board;
import com.kks.trashpedia.board.model.vo.ImgAttachment;
import com.kks.trashpedia.board.model.vo.Post;
import com.kks.trashpedia.board.model.vo.SubCategory;
import com.kks.trashpedia.common.FileStore;
import com.kks.trashpedia.common.service.CommonService;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class CommonController {
	
	@Autowired
	private CommonService service;
	
	@Autowired
	private FileStore fileStore;
	
	//카테고리 정보 가지고오기
	@GetMapping("/write")
	public ModelAndView getCategory(int bigCategoryNo, int subCategoryNo, int type) {
		
		ModelAndView mv = new ModelAndView();
		SubCategory subcategory = new SubCategory();
		
		subcategory.setBigCategoryNo(bigCategoryNo);
		subcategory.setSubCategoryNo(subCategoryNo);
		
		SubCategory category = service.getSubCategory(subcategory);
		mv.addObject("category",category);
		mv.addObject("type",type);
		mv.setViewName("pledge/pledgeInsert");
		
		return mv;
	}
	
	//게시글 등록
	@PostMapping("/write")
	public ModelAndView insertBoard(
			SubCategory subcategory, 
			Post p, 
			Board b,
			RedirectAttributes ra, 
			@RequestParam("thumbnail") MultipartFile thumbnailImage,
			@RequestParam("upfile") MultipartFile upfile,
			@RequestParam int type,
			HttpServletRequest request
			/*,SessionAttribute session*/
			) throws IOException {

		ModelAndView mv = new ModelAndView();
		
		// post 등록
		int postNo = service.createPost(p);

		b.setPostNo(postNo);
		b.setSubCategoryNo(subcategory.getSubCategoryNo());
			
		// board 등록
		if (postNo > 0) {
			
			int boardNo = service.createBoard(b);
			System.out.println(boardNo);
			
			if (boardNo > 0) { 		
				
				//첨부파일, 이미지 파일 저장
				Attachment attachment = fileStore.storeFile(upfile);
				ImgAttachment image = fileStore.storeImage(thumbnailImage);
				
				if(attachment!=null) {
					attachment.setRefBno(boardNo);
					attachment.setFileType(type);
				}
				if(image!=null) {
					image.setRefBno(boardNo);
					image.setImgType(type);
					}
				
				System.out.println(attachment);
				System.out.println(image);
				
				int result = service.insertFiles(attachment,image);
				
				ra.addFlashAttribute("alert","게시글이 작성되었습니다."); 
				}
			else { 
				ra.addFlashAttribute("alert", "게시글 작성에 실패하셨습니다.");
			}
		} else {
			ra.addFlashAttribute("alert", "게시글 작성에 실패하셨습니다.");
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	
	//이미지출력
	@ResponseBody
	@GetMapping("/image/{filename}")
	public UrlResource showImage(@PathVariable String filename) throws MalformedURLException {
		
		UrlResource url = new UrlResource("file:" + fileStore.getFullPath2(filename));
		
	    return url;
	}
	
	
	//첨부파일다운로드
	//@GetMapping("/attach/{boardNo}")
	//public ResponseEntity<Resource> downloadAttach(@PathVariable int boardNo) throws MalformedURLException{
		
		//Attachment attach = service.getAttachment(boardNo);
		
//		String storeFilename = 
		
		
		
		
	//}
	
	
	
	//수정날짜 바꿀때 사용할거
//	LocalDateTime nowTime = LocalDateTime.now();
//	java.sql.Date date = java.sql.Date.valueOf(nowTime.toLocalDate());
//	b.setModifyDate(date);
//	System.out.println("date = "  +date);
		

		
	
	
	
	
}
