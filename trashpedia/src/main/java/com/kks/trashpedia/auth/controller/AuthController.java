package com.kks.trashpedia.auth.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.auth.model.service.AuthService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/")
public class AuthController {
	
	private final AuthService authService;

	@GetMapping("/login")
    public ModelAndView loginForm() {
        ModelAndView mav = new ModelAndView("user/login");
        String kakao = authService.kakaoUrl();
        mav.addObject("kakao",kakao);
        return mav;
    }
	
    @GetMapping("/auth/emailCode")
    public String EmailCheck(@RequestParam String userEmail)  {
    	String authCode = "";
		try {
			authCode = authService.sendEmail(userEmail);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return authCode;
    }
    
    @GetMapping("/auth/temporaryPwd")
    public int temporaryPwd(String userEmail, String phone) {
    	int authCode = 0;
    	try {
			authCode = authService.temporaryPwd(userEmail, phone);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
    	return authCode;
    }
    
    @GetMapping("/kakao/login")
    public void kakaoLogin(HttpServletResponse response) {
    	try {
			response.sendRedirect(authService.kakaoUrl());
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    @GetMapping("/kakao/callback")
    public ModelAndView kakaoGetToken(@RequestParam("code") String code) {
    	ModelAndView mav = new ModelAndView("/");
    	String access_token = null;
		try {
			access_token = authService.getKakaoToken(code);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	System.out.println(access_token);
    	return mav;
    }
}
