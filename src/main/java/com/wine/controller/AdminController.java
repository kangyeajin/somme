package com.wine.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wine.model.AttachVO;
import com.wine.model.EventVO;
import com.wine.model.MemberVO;
import com.wine.model.NoticeVO;
import com.wine.model.OrderVO;
import com.wine.model.PageDTO;
import com.wine.model.ProductVO;
import com.wine.model.prodCriteria;
import com.wine.service.EventService;
import com.wine.service.MemberService;
import com.wine.service.NoticeService;
import com.wine.service.OrderService;
import com.wine.service.ProductService;
import com.wine.service.QnaService;
import com.wine.service.ReviewService;
import com.wine.service.WorkerService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@Secured({"ROLE_ADMIN"})
@AllArgsConstructor
public class AdminController {
	@Setter(onMethod_ = @Autowired)
	private WorkerService service;

	@Setter(onMethod_ = @Autowired)
	private ProductService service2;

	@Setter(onMethod_ = @Autowired)
	private MemberService service3;

	@Setter(onMethod_ = @Autowired)
	private OrderService orderservice;
	
	private final NoticeService nService;
	private final ReviewService rService;
	private final QnaService qService;
	private final EventService eService;

	@RequestMapping("main")
	public String main() {
		log.info("main가 호출되었습니다.");
		return "admin/main";
	}

//	@PostMapping("login")
//	public String adminLogin(WorkerVO workerVO, HttpServletRequest req, RedirectAttributes rttr){
//		HttpSession session = req.getSession();
//		String id = workerVO.getId();
//		System.out.println("아이디"+id);
//		String pwd = workerVO.getPwd();
//		System.out.println("비번"+pwd);
//		WorkerVO workerVOo = service.adminlogin(id, pwd);
//		if (workerVOo != null) {
//			session.setAttribute("id", id);
//			return "redirect:/admin/product/productList";
//		} else {
//			req.setAttribute("message", "입력한 정보가 올바르지 않거나 존재하지 않는 회원입니다");
//			return "admin/main";
//		}
//	}
//
//	@RequestMapping("logout")
//	public String logout(HttpSession session) {
//		log.info("logout이 호출되었습니다.");
//		session.invalidate();
//		return "redirect:http://localhost:8090/main/";
//	}

	@GetMapping("/product/productList")
	public void productList(prodCriteria cri2, HttpServletRequest request, Model model){
		//페이징 처리하기 prodCriteria => cri2
		
		List<ProductVO> productList = service2.adminProdPaging(cri2);
		model.addAttribute("productList", productList);
		
		int total = service2.getTotal(cri2);
		log.info("**total count : " + total );
		
		model.addAttribute("pageMaker", new PageDTO(cri2,total));
	}

	@GetMapping("/product/productWrite") 
	public String productWrite(HttpServletRequest request) {
		log.info("productWrite가 호출되었습니다.");

		String kindList[] = { "RED", "ROSE", "SPARKLING", "WHITE"}; 
		String kind_conList[] = { "USA", "CHILE", "SPAIN", "ITALY", "FRANCE", "AUSTRALIA", "GERMANY"}; 
		String mainprodList[] = {"O","X" };

		request.setAttribute("kindList", kindList);
		request.setAttribute("kind_conList", kind_conList);
		request.setAttribute("mainprodList", mainprodList);

		return "admin/product/productWrite";
	}

	//form등록
	@PostMapping("/product/uploadFormAction")
	public String insertProduct(MultipartFile[] uploadFile, Model model, ProductVO pVo, RedirectAttributes rttr) {

		String uploadFolder = "C:\\upload";
		for (MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		} // end for

		pVo.setImage(uploadFile[0].getOriginalFilename());
		pVo.setContent_2(uploadFile[1].getOriginalFilename());

		log.info("등록 : " + pVo);

		service2.insertProduct(pVo);
		rttr.addFlashAttribute("result", pVo.getProdno());
		return "redirect:/admin/product/productList";

	}

	@PostMapping("/product/multiDelete")
	public String multiDelete(HttpServletRequest req, prodCriteria cri2, RedirectAttributes rttr) {
		
		log.info("*********************" + cri2);
		
		String[] prodno = req.getParameterValues("RowCheck");
		log.info(prodno[0]);
		for(int i=0 ; i<prodno.length ; i++) {
			if (service2.multiDelete(prodno[i])){
				rttr.addFlashAttribute("result");
			}
		}
		rttr.addAttribute("pageNum", cri2.getPageNum());
		rttr.addAttribute("amount", cri2.getAmount());
		rttr.addAttribute("type", cri2.getType());
		rttr.addAttribute("keyword", cri2.getKeyword());

		return "redirect:/admin/product/productList";
	}
	
	@GetMapping("/product/productUpdate")
	public String productUpdate(ProductVO pVo, prodCriteria cri2, HttpServletRequest request, Model model){

		log.info("productUpdate가 호출되었습니다.");
		log.info("*********************" + cri2);
		
		String code = request.getParameter("prodno");
		ProductVO productVO = service2.selectProductByCode(code);
		log.info("---------------"+code);		

		model.addAttribute("productVO",productVO);

		String kindList[] = { "RED", "ROSE", "SPARKLING", "WHITE"}; 
		String kind_conList[] = { "USA", "CHILE", "SPAIN", "ITALY", "FRANCE", "AUSTRALIA", "GERMANY"}; 
		String mainprodList[] = {"O","X" };

		request.setAttribute("kindList", kindList);
		request.setAttribute("kind_conList", kind_conList);
		request.setAttribute("mainprodList", mainprodList);
		request.setAttribute("cri2", cri2);

		return "admin/product/productUpdate";
	}

	@PostMapping("/product/productUpdateFormAction")
	public String updateProduct(
			@RequestParam("content_2") String content_2, 
			@RequestParam("image") String image,
			MultipartFile[] uploadFile, Model model, ProductVO pVo, prodCriteria cri2, HttpServletRequest request, RedirectAttributes rttr) throws FileNotFoundException{

		
		log.info("mainprod-----"+pVo);

		String uploadFolder = "C:\\upload";

		for (MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
		} // end for

		if(uploadFile[0].getSize() == 0) {
			pVo.setImage(image);
		}else {
			pVo.setImage(uploadFile[0].getOriginalFilename());
		}

		if(uploadFile[1].getSize() == 0) {
			pVo.setContent_2(content_2);
		}else {
			pVo.setContent_2(uploadFile[1].getOriginalFilename());
		}

		if (service2.updateProduct(pVo)) {
			rttr.addFlashAttribute("result", pVo.getProdno());
		}
		
		rttr.addAttribute("pageNum", cri2.getPageNum());
		rttr.addAttribute("amount", cri2.getAmount());
		rttr.addAttribute("type", cri2.getType());
		rttr.addAttribute("keyword", cri2.getKeyword());

		return "redirect:/admin/product/productList";

	}
	/* ---------------- member -------------------- */
	@GetMapping("/member/memberList")
	public void memberList(prodCriteria cri2, HttpServletRequest request, Model model){
		List<MemberVO> memberList = service3.adminMemberPage(cri2);
		model.addAttribute("memberList", memberList);
		
		int total = service3.getTotalCount(cri2);
		System.out.println("**total count : " + total );
		
		model.addAttribute("pageMaker", new PageDTO(cri2,total));
	}

	@PostMapping("/member/multiMemberDelete")
	public String multiMemberDelete(HttpServletRequest req, prodCriteria cri2, RedirectAttributes rttr) {

		String[] id = req.getParameterValues("RowCheck");
		log.info(id[0]);
		for(int i=0 ; i<id.length ; i++) {
				if (service3.multiMemberDelete(id[i])){
				rttr.addFlashAttribute("result");
			}
		}
		
		rttr.addAttribute("pageNum", cri2.getPageNum());
		rttr.addAttribute("amount", cri2.getAmount());
		rttr.addAttribute("type", cri2.getType());
		rttr.addAttribute("keyword", cri2.getKeyword());
		
		return "redirect:/admin/member/memberList";
	}
	
	
	/* ---------------- order -------------------- */
	
	@GetMapping("/order/orderList")
	public void orderList(prodCriteria cri2, HttpServletRequest request, Model model){

		ArrayList<OrderVO> orderList = orderservice.listOrder(cri2);
	    model.addAttribute("orderList", orderList);
	    
	    int total = orderservice.getTotalCount(cri2);
	    
		model.addAttribute("pageMaker", new PageDTO(cri2,total));
	}
	
	@GetMapping("/order_save")
	public String order_save(HttpServletRequest request, Model model,prodCriteria cri2, RedirectAttributes rttr){
		
		rttr.addAttribute("pageNum", cri2.getPageNum());
		rttr.addAttribute("amount", cri2.getAmount());
		rttr.addAttribute("type", cri2.getType());
		rttr.addAttribute("keyword", cri2.getKeyword());
		
		//detailno을 배열로 받아옴 
	    String[] resultArr = request.getParameterValues("RowCheck");

	    for(String detailno:resultArr){
	        orderservice.updateOrderResult(detailno);
	    }
		
	    return "redirect:/admin/order/orderList";
	}
	
	@GetMapping("/order/cancelList")
	public void cancelList(prodCriteria cri2, HttpServletRequest request, Model model){
	    ArrayList<OrderVO> orderList = orderservice.cancellistOrder(cri2);
	    model.addAttribute("orderList", orderList);
		int total = orderservice.getCancelTotalCount(cri2);
		log.info("**total count : " + total );
		model.addAttribute("pageMaker", new PageDTO(cri2,total));
	}
	
	@GetMapping("/order_cancel")
	public String order_cancel(HttpServletRequest request, Model model,prodCriteria cri2, RedirectAttributes rttr){
		
		rttr.addAttribute("pageNum", cri2.getPageNum());
		rttr.addAttribute("amount", cri2.getAmount());
		rttr.addAttribute("type", cri2.getType());
		rttr.addAttribute("keyword", cri2.getKeyword());
		
		//detailno을 배열로 받아옴 
	    String[] resultArr = request.getParameterValues("RowCheck");
	      
	    for(String detailno:resultArr){
	        orderservice.updateCancelOKResult(detailno);
	    }
	    
	    return "redirect:/admin/order/cancelList";
	}
	
	
//	게시판ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@GetMapping("/notice/notice")
	public void noticeList(prodCriteria cri, Model model){
		model.addAttribute("noticeList", nService.getListA(cri));
		int total = nService.getTotalA(cri);
		log.info("----admin/notice 호출----");
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	@GetMapping("/notice/notice_detail")
	public void noticeDetail(Model model, Long noticeno) {
		model.addAttribute("noticeVO",nService.getDetail(noticeno));
	}
	@GetMapping("/notice/noticeMultiDelete")
	public String noticeMultiDelete(prodCriteria cri2, Long[] RowCheck){
		for (Long noticeno : RowCheck) {
			nService.delete(noticeno);
		}
		return "redirect:/admin/notice/notice"+cri2.getListLink();
	}
	@GetMapping("/notice/notice_write")
	public void noticeWriteForm() {
		log.info("----notice_write_form 호출----");
	}
	@PostMapping(value="/notice/notice_write")
	public String noticeWrite(NoticeVO nVo, RedirectAttributes rttr) {
		log.info("----notice_write 호출----");
		if(nVo.getAttachList() != null) {
			nVo.getAttachList().forEach(attach ->log.info(attach));
		}
		
		nService.insert(nVo);
		rttr.addFlashAttribute("resultNo", nVo.getNoticeno());

		return "redirect:/admin/notice/notice";
	}
	@GetMapping(value="/notice/getAttachList", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody //자바 객체를 JSON기반의 HTTP body로 변환
	public ResponseEntity<List<AttachVO>> getAttachList(Long noticeno){
		log.info("getAttachList "+noticeno);
		return new ResponseEntity<>(nService.gettAttachList(noticeno), HttpStatus.OK);
	}
	@GetMapping("/notice/noticeDelete")
	public String noticeDelete(@ModelAttribute("cri2") prodCriteria cri2, Long noticeno, RedirectAttributes rttr) {
		List<AttachVO> attachList = nService.gettAttachList(noticeno);
	    if (nService.delete(noticeno)) {
	    	deleteFiles(attachList);
	    	rttr.addFlashAttribute("resultNo", noticeno);
	    }
		return "redirect:/admin/notice/notice"+cri2.getListLink();
	}
	
	@GetMapping("/notice/notice_update")
	public void noticeUpdateForm(Model model, Long noticeno) {
		log.info("----notice_update_form 호출----");
		model.addAttribute("noticeVO", nService.getDetail(noticeno));
	}
	@PostMapping("/notice/notice_update")
	public String noticeUpdate(@ModelAttribute("cri2") prodCriteria cri2, NoticeVO nVo, RedirectAttributes rttr) {
		log.info("----notice_update 호출----");
		
		if (nService.update(nVo)) {
		      rttr.addFlashAttribute("resultNo", nVo.getNoticeno());
		}
		return "redirect:/admin/notice/notice"+cri2.getListLink();
	}
	@GetMapping("/notice/review")
	public void reviewList(prodCriteria cri, Model model){
		model.addAttribute("reviewList", rService.getListA(cri));
		int total = rService.getTotalA(cri);
		log.info("----admin/notice 호출----");
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	@GetMapping("/notice/review_detail")
	public void reviewDetail(Model model, Long reviewno) {
		model.addAttribute("reviewVO",rService.getDetail(reviewno));
	}
	@GetMapping("/notice/reviewMultiDelete")
	public String reviewMultiDelete(@ModelAttribute("cri2") prodCriteria cri2, Model model, Long[] RowCheck){
		for (Long reviewno : RowCheck) {
			rService.delete(reviewno);
		}
		log.info(cri2.getListLink());
		return "redirect:/admin/notice/review"+cri2.getListLink();
	}
	@GetMapping("/notice/bestSelect")
	public String bestSelect(@ModelAttribute("cri2") prodCriteria cri2, Long reviewno, String best) {
		log.info(reviewno+", "+best);
		rService.bestSelect(reviewno, best);
		return "redirect:/admin/notice/review"+cri2.getListLink();
	}
	@GetMapping("/notice/reviewDelete")
	public String reviewDelete(@ModelAttribute("cri2") prodCriteria cri2, Long reviewno, RedirectAttributes rttr){
		if(rService.delete(reviewno)) {
			rttr.addFlashAttribute("resultNo", reviewno);
		}
		return "redirect:/admin/notice/review"+cri2.getListLink();
	}
	@GetMapping("/notice/qna")
	public void qnaList(prodCriteria cri, Model model){
		log.info("----notice_update_form 호출----"+cri);
		model.addAttribute("qnaList", qService.getListA(cri));
		int total = qService.getTotalA(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	@GetMapping("/notice/qna_detail")
	public void qnaDetail(Model model, Long qnano) {
		model.addAttribute("qnavo", qService.getDetail(qnano));
	}
	@GetMapping("/notice/qnaMultiDelete")
	public String qnaMultiDelete(@ModelAttribute("cri2") prodCriteria cri2, Model model, Long[] RowCheck){
		for (Long qnano : RowCheck) {
			qService.delete(qnano);
		}
		return "redirect:/admin/notice/qna"+cri2.getListLink();
	}
	@PostMapping("/notice/qnaAnswer")
	public String qnaAnswer(@ModelAttribute("cri2") prodCriteria cri2, String reply){
		qService.qnaAnswer(reply, cri2.getQnano());
		return "redirect:/admin/notice/qna_detail"+cri2.getListLink(1)+"#adminid";
	}
	@GetMapping("/notice/qnaUpdate")
	public String qnaUpdate(@ModelAttribute("cri2") prodCriteria cri2, String reply){
		qService.qnaAnswer(reply, cri2.getQnano());
		return "redirect:/admin/notice/qna_detail"+cri2.getListLink(1)+"#adminid";
	}
	@GetMapping("/notice/qnaDelete")
	public String qnaDelete(@ModelAttribute("cri2") prodCriteria cri2, RedirectAttributes rttr){
		if(qService.delete(cri2.getQnano())) {
			rttr.addFlashAttribute("resultNo", cri2.getQnano());
		}
		return "redirect:/admin/notice/qna"+cri2.getListLink();
	}
	@GetMapping("/notice/event")
	public void eventList(Model model){
		log.info("----event 호출----");
		model.addAttribute("eventList", eService.getList());
	}
	@GetMapping("/notice/event_write")
	public void eventWriteForm() {
		log.info("----event_write_form 호출----");
	}
	@PostMapping(value="/notice/event_write")
	public String eventWrite(EventVO eVo, RedirectAttributes rttr) {
		log.info("----event_write 호출----");
		if(eVo.getAttachList() != null) {
			eVo.getAttachList().forEach(attach ->log.info(attach));
		}
		
		eService.insert(eVo);
		rttr.addFlashAttribute("resultNo", eVo.getEventno());

		return "redirect:/admin/notice/event";
	}
	@GetMapping("/notice/event_update")
	public void eventUpdateForm(Model model, @Param("eventno2") Long eventno) {
		log.info("----event_update_form 호출----");
		model.addAttribute("eventVO", eService.getDetail(eventno));
	}
	@PostMapping("/notice/event_update")
	public String eventUpdate(EventVO eVo, String img, String imgg, String popimg, String popimgg, RedirectAttributes rttr) {
		log.info("----event_update 호출----");
				if (img == null) {
					eVo.setImg(imgg);
				}
				if (popimg == null) {
					eVo.setPopimg(popimgg);
				}
		if (eService.update(eVo)) {
		      rttr.addFlashAttribute("resultNo", eVo.getEventno());
		}
		return "redirect:/admin/notice/event";
	}
	@GetMapping(value="/notice/eventGetAttachList", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachVO>> eventGetAttachList(Long eventno){
		log.info("getAttachList ");
		return new ResponseEntity<>(eService.eventGettAttachList(eventno), HttpStatus.OK);
	}
	@GetMapping("/notice/eventMultiDelete")
	public String eventMultiDelete(Model model, Long[] RowCheck){
		for (Long eventno: RowCheck) {
			eService.delete(eventno);
		}
		return "redirect:/admin/notice/event";
	}
	@GetMapping("/notice/eventUpload")
	public String eventUpload(Long eventno, Long upload){
		eService.upload(eventno, upload);
		return "redirect:/admin/notice/event";
	}
	
	 private void deleteFiles(List<AttachVO> attachList) {
		 if(attachList == null || attachList.size() ==0) {
			 return;
		 }
		 
		 
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