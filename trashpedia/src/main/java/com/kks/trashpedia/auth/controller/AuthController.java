package com.kks.trashpedia.auth.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.auth.model.service.AuthService;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/")
public class AuthController {
	
	private final AuthService authService;

	@GetMapping("/login")
    public ModelAndView loginForm() {
        ModelAndView mav = new ModelAndView("user/login");
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
}
