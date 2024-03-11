package com.kks.trashpedia.auth.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.auth.model.dto.KakaoUserInfoResponse;
import com.kks.trashpedia.auth.model.dto.NaverUserInfoResponse;
import com.kks.trashpedia.auth.model.service.AuthService;
import com.kks.trashpedia.member.model.vo.Member;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
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
    public ModelAndView checkKakaoLogin(String code, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String access_Token = authService.kakaoGetToken(code);
		
		KakaoUserInfoResponse sns = authService.getKakaoProperties(access_Token);
		Member m = authService.getSocialUser(sns.getId());
		
		if (m != null) {
			request.getSession().setAttribute("authentication", m);
			mav.setViewName("redirect:/");
		} else {
			if (authService.emailCheck(sns.getKakao_account().getEmail())) {
				int result = authService.joinMemberSocial(sns.getKakao_account().getEmail(), sns.getId());

				if (result > 0) {
					m = authService.getSocialUser(sns.getId());
					request.getSession().setAttribute("alert", "기존에 가입한 " + m.getUserEmail() + "과 연동되었습니다.");
					request.getSession().setAttribute("authentication", m);
					mav.setViewName("redirect:/");
				}
			} else {
				request.getSession().setAttribute("sns", sns.getKakao_account());
				request.getSession().setAttribute("socialId", sns.getId());
				request.getSession().setAttribute("socialType", "kakao");
				request.getSession().setAttribute("alert", "추가 정보를 입력하여 회원가입을 완료해주세요");
				mav.setViewName("user/join");
				mav.setViewName("redirect:/member/join");
			}
		}
		return mav;
    }

    @GetMapping("/naver/login")
    public void naverLogin(HttpServletResponse response) {
    	try {
    		response.sendRedirect(authService.naverUrl());
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
    }
    
    @GetMapping("/naver/callback")
    public ModelAndView checkNaverLogin(String code, String state, HttpServletRequest request) {
    	ModelAndView mav = new ModelAndView();
    	String access_Token = authService.naverGetToken(code);
    	
    	NaverUserInfoResponse sns = authService.getNaverProperties(access_Token);
    	Member m = authService.getSocialUser(sns.getResponse().getId());
    	
    	if (m != null) {
    		request.getSession().setAttribute("authentication", m);
    		mav.setViewName("redirect:/");
    	} else {
    		if (authService.emailCheck(sns.getResponse().getEmail())) {
    			int result = authService.joinMemberSocial(sns.getResponse().getEmail(), sns.getResponse().getId());
    			
    			if (result > 0) {
    				m = authService.getSocialUser(sns.getResponse().getId());
    				request.getSession().setAttribute("alert", "기존에 가입한 " + m.getUserEmail() + "과 연동되었습니다.");
    				request.getSession().setAttribute("authentication", m);
    				mav.setViewName("redirect:/");
    			}
    		} else {
    			System.out.println(sns.getResponse());
    			request.getSession().setAttribute("sns", sns.getResponse());
    			request.getSession().setAttribute("socialId", sns.getResponse().getId());
    			request.getSession().setAttribute("socialType", "naver");
    			request.getSession().setAttribute("alert", "추가 정보를 입력하여 회원가입을 완료해주세요");
    			mav.setViewName("user/join");
    			mav.setViewName("redirect:/member/join");
    		}
    	}
    	return mav;
    }
}
