package com.kks.trashpedia.trash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.trash.model.service.TrashService;

@RestController
public class TrashController {
	@Autowired
	private TrashService service;
	
	
}