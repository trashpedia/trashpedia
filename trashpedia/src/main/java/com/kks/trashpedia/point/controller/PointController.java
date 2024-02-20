package com.kks.trashpedia.point.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.point.model.service.PointService;

@RestController
public class PointController {
	@Autowired
	private PointService service;
	
	
}
