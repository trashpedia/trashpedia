package com.kks.trashpedia.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.member.model.service.MemberService;

@RestController
public class MemberController {
	@Autowired
	private MemberService service;
}
