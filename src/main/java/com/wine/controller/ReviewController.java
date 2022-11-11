package com.wine.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wine.model.AttachVO;
import com.wine.model.Criteria;
import com.wine.model.ReviewVO;
import com.wine.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@AllArgsConstructor
@Log4j
public class ReviewController {
	
	private final ReviewService rService;
	
	@RequestMapping("/review_best")
	public String reviewBest(Model model) {
		log.info("----review_best 호출----");
		model.addAttribute("BestreviewList",rService.getList());
		return "review/review_best";
	}
	@RequestMapping("/review_best_detail")
	public String reviewBestDetail(Model model, Long reviewno) {
		rService.readCount(reviewno);
		log.info("----review_best_detail 호출----");
		model.addAttribute("reviewVO",rService.getDetail(reviewno));
		return "review/review_best_detail";
	}
	@RequestMapping("/review_detail")
	public String reviewDetail(@ModelAttribute("cri") Criteria cri, Model model, Long reviewno, String prodno) {
		rService.readCount(reviewno);
		log.info("----review_detail 호출----");
		model.addAttribute("reviewVO",rService.getDetail(reviewno));
		model.addAttribute("prev",rService.getPagePrev(reviewno, prodno));
		model.addAttribute("next",rService.getPageNext(reviewno, prodno));
		return "review/review_detail";
	}
	@GetMapping("/review_write")
	public void qnaWriteForm() {
		log.info("----review_write_form 호출----");
	}
	@RequestMapping(value="/review_write", method=RequestMethod.POST)
	public String qnaWrite(ReviewVO rVo, String prodno, RedirectAttributes rttr) {
		log.info("----review_write 호출----");
		log.info("==================");
		log.info("insert: "+rVo);
		if(rVo.getAttachList() != null) {
			rVo.getAttachList().forEach(attach ->log.info(attach));
		}
		log.info("==================");
		
		rService.insert(rVo);
		rttr.addFlashAttribute("resultNo", rVo.getReviewno());

		return "redirect:/product/detail?prodno="+prodno+"#box2";
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody //자바 객체를 JSON기반의 HTTP body로 변환
	public ResponseEntity<List<AttachVO>> getAttachList(Long reviewno){
		log.info("getAttachList "+reviewno);
		return new ResponseEntity<>(rService.gettAttachList(reviewno), HttpStatus.OK);
	}
	
	@RequestMapping("/check_pwd")
	public void checkPwd() {
		log.info("----check_pwd 호출----");
	}
	@RequestMapping("/check_success")
	public String checkPwd(@ModelAttribute("cri") Criteria cri, ReviewVO rVo, String prodno, Long reviewno, String val, Model model, RedirectAttributes rttr) {
		log.info("----check_success 호출----");
		if(rService.pwdCheck(rVo) != null && val.equals("삭제하기")) {
			List<AttachVO> attachList = rService.gettAttachList(reviewno);
			if(rService.delete(reviewno)){
				deleteFiles(attachList);
				rttr.addFlashAttribute("resultNo", reviewno);
			}
			return "redirect:/product/detail"+cri.getListLink(1)+"#box2";
		}else if(rService.pwdCheck(rVo) != null && val.equals("수정하기")) {
			model.addAttribute("reviewVO", rService.getDetail(reviewno));
			return "review/review_update";
		}else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "/review/check_pwd";
		}
	}
	@GetMapping("/review/review_update")
	public void reviewUpdateForm() {
		log.info("----review_update_form 호출----");
	}
	@PostMapping("/review/review_update")
	public String reviewUpdate(@ModelAttribute("cri") Criteria cri, ReviewVO rVo, String reviewList, String prodno, RedirectAttributes rttr) {
		log.info("----review_update 호출----"+rVo);
		if (rService.update(rVo)) {
		      rttr.addFlashAttribute("resultNo", rVo.getReviewno());
		}
		return "redirect:/product/detail"+cri.getListLink(1)+"#box2";
	}
	 private void deleteFiles(List<AttachVO> attachList) {
		 //파일목록이 없으면 안해도됨
		 if(attachList == null || attachList.size() ==0) {
			 return;
		 }
		 
		 log.info("delete attach files...................");
		 log.info(attachList);
		 
		 //파일 마다 원본이랑 썸넬 삭제해줌
		 attachList.forEach(attach -> {
			 try {
				 Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				 
				 Files.deleteIfExists(file);
				 
				 if(Files.probeContentType(file).startsWith("image")) {
					 Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					 Files.delete(thumbNail);
				 }
			 }catch(Exception e) {
				 log.error("delete file error"+e.getMessage());
			 }
		 });
	 }
}
