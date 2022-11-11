package com.wine.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wine.service.WineSelectService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/wineselect/*")
@AllArgsConstructor
@Log4j
public class WineSelectController {
	
	private WineSelectService wService;
	
	@RequestMapping("/wineselect")
	public String wineSelect(Model model) {
		model.addAttribute("count",wService.count());
		return "wineselect/wineselect";
	}
	
	@RequestMapping("/wineselect_result")
	public String wineSelectResult(Model model, Long resultno) {
		wService.readCount();
		model.addAttribute("wineSelectList", wService.getList(resultno));
		return "wineselect/wineselect_result";
	}
}
