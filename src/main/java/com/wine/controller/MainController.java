package com.wine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wine.service.EventService;
import com.wine.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main/*")
@Log4j
@AllArgsConstructor
public class MainController {
	private ProductService service;
	private EventService eService;
	
	@RequestMapping("/")
	public void main(Model model){
		model.addAttribute("mainlist", service.selectMainProducts());
		model.addAttribute("uploadEventList", eService.uploadList());
	}
}