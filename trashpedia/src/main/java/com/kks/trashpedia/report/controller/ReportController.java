package com.kks.trashpedia.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.kks.trashpedia.report.model.service.ReportService;

@RestController
public class ReportController {
	@Autowired
	private ReportService service;
	
	
}