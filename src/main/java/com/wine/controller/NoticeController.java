package com.wine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wine.model.Criteria;
import com.wine.model.PageDTO;
import com.wine.service.EventService;
import com.wine.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice/*")
@AllArgsConstructor
@Log4j
public class NoticeController {
	
	private final NoticeService nService;
	private final EventService eService;
	
	@RequestMapping("/notice")
	public void notice(Criteria cri, Model model) {
		model.addAttribute("noticeList", nService.getList(cri));
		int total = nService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total,5.0,5,4));
		log.info("----notice_detail 호출----"+cri);
	}
	@RequestMapping("/notice_detail")
	public void noticeDetail(@ModelAttribute("cri") Criteria cri, Model model, Long noticeno) {
		log.info("----notice_detail 호출----");
		nService.readCount(noticeno);
		model.addAttribute("noticeVO",nService.getDetail(noticeno));
		model.addAttribute("prev",nService.getPagePrev(noticeno));
		model.addAttribute("next",nService.getPageNext(noticeno));
	}

	@RequestMapping("/event")
	public String event(Model model) {
		log.info("----event 호출----");
		model.addAttribute("uploadEventList", eService.uploadList());
		return "notice/event";
	}
}
