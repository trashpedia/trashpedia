package com.kks.trashpedia.pledge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.pledge.model.service.PledgeService;

@RestController
public class PledgeController {
	@Autowired
	private PledgeService service;
	
}