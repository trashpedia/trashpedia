package com.kks.trashpedia.auth.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/login")
public class AuthController {
	
	@GetMapping(value={"", "/"})
    public ModelAndView loginForm() {
        ModelAndView mav = new ModelAndView("user/login");
        return mav;
    }
}
