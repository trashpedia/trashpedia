package com.kks.trashpedia.email.controller;

import java.io.UnsupportedEncodingException;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.email.service.EmailService;

import jakarta.mail.MessagingException;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class EmailController {
	
	private final EmailService emailService;
	
	@ResponseBody
    @PostMapping("/member/emailCode")
    public String EmailCheck(@RequestParam String email)  {
        String authCode = "";
		try {
			authCode = emailService.sendEmail(email);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return authCode;
    }
}
