package com.kks.trashpedia.common;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class TrashPediaExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    public String handleException(Exception e, Model model) {
    	
    	//에러발생이유 로깅
    	e.printStackTrace(); 

    	//에러발생이유 화면 전달
//		String errorMessage = e.getMessage();
//		model.addAttribute("errorMessage", errorMessage);

		// 포워딩할 페이지 설정
        return "forward:/errorPage";
        
    }
}	