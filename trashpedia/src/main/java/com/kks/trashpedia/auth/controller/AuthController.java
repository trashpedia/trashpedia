package com.kks.trashpedia.auth.controller;

import java.util.HashMap;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.auth.model.dto.User;
import com.kks.trashpedia.auth.model.jwt.JwtTokenProvider;
import com.kks.trashpedia.auth.model.service.KakaoAuthService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/login")
public class AuthController {
	
	private final KakaoAuthService service;
	private final JwtTokenProvider provider;
	
//	@GetMapping("/")
//	public ModelAndView login() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("user/login");
//		return mav;
//	}
	
	 @GetMapping("/") // 추가
	    public ModelAndView login() { // 추가
	        ModelAndView mav = new ModelAndView(); // 추가
	        mav.setViewName("user/login"); // 추가
	        return mav; // 추가
	    } // 추가
	
	@PostMapping("/login/{sns}")
	public ResponseEntity<HashMap<String, Object>> authCheck(
			@PathVariable String sns , 
			@RequestBody HashMap<String ,String> param
			){
		User user = service.login(param.get("idToken"));
		HashMap<String , Object> map = new HashMap<>();
		map.put("user", user);
		map.put("jwtToken", provider.createToken(user.getSocialId()));
		
		return ResponseEntity.ok(map);
	}
}
