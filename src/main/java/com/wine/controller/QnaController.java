package com.wine.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wine.model.Criteria;
import com.wine.model.NoticeVO;
import com.wine.model.PageDTO;
import com.wine.model.AttachVO;
import com.wine.model.QnaVO;
import com.wine.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/qna/*")
@AllArgsConstructor
@Log4j
public class QnaController {

	private final QnaService qService;
	@RequestMapping("/QNA")
	public void qna(Criteria cri, Model model) {
		model.addAttribute("qnaList", qService.getList(cri));
		int total = qService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total,5.0,5,4));
	}
	@RequestMapping("/QNA_detail")
	public void qnaDetail(@ModelAttribute("cri") Criteria cri, Model model, Long qnano) {
		qService.readCount(qnano);
		log.info("----QNA_detail 호출----");
		model.addAttribute("qnavo", qService.getDetail(qnano));
		model.addAttribute("prev",qService.getPagePrev(qnano));
		model.addAttribute("next",qService.getPageNext(qnano));
	}
	@GetMapping("/QNA_write")
	public void qnaWriteForm(Model model, String[] qnaList) {
		log.info("----QNA_write_form 호출----");
		model.addAttribute("qnaList", QnaService.qnaList);
	}
	@RequestMapping(value="/QNA_write", method=RequestMethod.POST)
	public String qnaWrite(QnaVO qVo, RedirectAttributes rttr, String subject,String whatever) {
		log.info("----QNA_write 호출----");
		if(subject.equals("직접입력")) {
	    	qVo.setSubject(whatever);
		}
	    log.info("==================");
		log.info("insert: "+qVo);
		if(qVo.getAttachList() != null) {
			qVo.getAttachList().forEach(attach ->log.info(attach));
		}
		log.info("==================");
		
		qService.insert(qVo);
		rttr.addFlashAttribute("resultNo", qVo.getQnano());
	    
		return "redirect:/qna/QNA";
	}
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody //자바 객체를 JSON기반의 HTTP body로 변환
	public ResponseEntity<List<AttachVO>> getAttachList(Long qnano){
		log.info("getAttachList "+qnano);
		return new ResponseEntity<>(qService.gettAttachList(qnano), HttpStatus.OK);
	}
	
	@RequestMapping("/check_pwd")
	public void checkPwd() {
		log.info("----check_pwd 호출----");
	}
	
	@RequestMapping("/check_success")
	public String checkPwd(@ModelAttribute("cri") Criteria cri, QnaVO qVo, Long qnano, String val, Model model, RedirectAttributes rttr) {
		log.info("----check_success 호출----"+qnano+qVo.getQnano());
		if(qService.pwdCheck(qVo) != null && val.equals("삭제하기")) {
			List<AttachVO> attachList = qService.gettAttachList(qnano);
			if(qService.delete(qnano)) {
				deleteFiles(attachList);
				rttr.addFlashAttribute("resultNo", qnano);
			}
			return "redirect:/qna/QNA"+cri.getListLink();
		}else if(qService.pwdCheck(qVo) != null && val.equals("수정하기")) {
			model.addAttribute("qnaList", QnaService.qnaListUpdate);
			model.addAttribute("qnavo", qService.getDetail(qnano));
			return "qna/QNA_update";
		}else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "/qna/check_pwd";
		}
	}
	@GetMapping("/qna/QNA_update")
	public void qnaUpdateForm() {
		log.info("----qna_update_form 호출----");
	}
	@PostMapping("/qna/QNA_update")
	public String qnaUpdate(@ModelAttribute("cri") Criteria cri, QnaVO qVo, String qnaList, String whatever, String originSubject, RedirectAttributes rttr) {
		log.info("----qna_update 호출----");
		if(qnaList.equals("변경 시에만 선택해 주세요")) {
			qVo.setSubject(originSubject);
		}else if(qnaList.equals("직접입력")) {
	    	qVo.setSubject(whatever);
		}else {
			qVo.setSubject(qnaList);
		}
		if (qService.update(qVo)) {
		      rttr.addFlashAttribute("resultNo", qVo.getQnano());
		}
		return "redirect:/qna/QNA"+cri.getListLink();
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
