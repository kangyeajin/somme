package com.wine.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wine.model.MemberVO;
import com.wine.model.OrderVO;
import com.wine.service.MemberService;
import com.wine.service.OrderService;
import com.wine.service.ProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Setter(onMethod_=@Autowired)
	private OrderService orderService;

	@Setter(onMethod_=@Autowired)
	private ProductService prodService;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	/* ==============추가======================= */
	@PostMapping("/go_login")
	public String go_login(@RequestParam String prodno, HttpServletRequest request, Model model) {
		if (prodno != null) {
			model.addAttribute("prodno", prodno);
		}
		return "member/login";
	}
	/* ======================================== */

	@GetMapping("loginForm")
	public String loginForm() {
		log.info("get loginForm이 호출되었습니다.");
		return "member/login";
	}

	@PostMapping("loginForm")
	public String loginForm(HttpSession session, @RequestParam String id) {
		log.info("post loginForm이 호출되었습니다.");
		log.info("id값은 " + id);
		session.setAttribute("id", id);
		return "member/login";
	}
	
	//틀릴경우 메세지 띄우기
	@GetMapping("/login")
	public void memberlogin(String error, String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "아이디 혹은 비밀번호를 확인해주세요");
		}
		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
//	@GetMapping("/login")
//	public void memberlogin(@RequestParam String prodno, String error, String logout, Model model) {
//		
//		if (prodno != null) {
//			model.addAttribute("prodno", prodno);
//			log.info("이전에 보고있던 제품번호"+prodno);
//		}
//		
//		log.info("error: " + error);
//		log.info("logout: " + logout);
//
//		if (error != null) {
//			model.addAttribute("error", "아이디 혹은 비밀번호를 확인해주세요");
//		}
//		if (logout != null) {
//			model.addAttribute("logout", "Logout!!");
//		}
//	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		log.info("logout이 호출되었습니다.");

		String access_Token = (String) session.getAttribute("access_Token");
		if (access_Token != null) {
			log.info("지우려는 토큰 값은" + access_Token);
			service.getLogout((String) session.getAttribute("access_Token"));
		}
		session.invalidate();
		return "redirect:/main/";
	}

	@RequestMapping("step1")
	public String step1() {
		log.info("step1이 호출되었습니다.");
		return "member/step1";
	}

	@RequestMapping("popup")
	public String popup() {
		log.info("popup이 호출되었습니다.");
		return "member/popup";
	}

	@PostMapping("join_from")
	public String join_from(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		log.info("join_from이 호출되었습니다.");
		String agree1 = req.getParameter("agree1");
		System.out.println("agree1이 step2로 가는중" + agree1);
		String agree2 = req.getParameter("agree2");
		System.out.println("agree2이 step2로 가는중" + agree2);

		if (agree1 == null) {
			agree1 = "0";
		}
		req.setAttribute("agree1", agree1);

		if (agree2 == null) {
			agree2 = "0";
		}
		req.setAttribute("agree2", agree2);

		return "member/step2";
	}

	@GetMapping("send_sms_form")
	public String send_sms_form() {
		log.info("send_sms_form이 호출되었습니다.");
		return "member/user_chk";
	}

	@PostMapping("send_sms")
	public String send_sms(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		log.info("send_sms이 호출되었습니다.");
		String phone = req.getParameter("phone");
		String numStr = service.PhoneNumCheck(phone);
		log.info("전화번호는 .:" + phone);
		log.info("암호는 .:" + numStr);
		req.setAttribute("phone", phone);
		req.setAttribute("code", numStr);
		return "member/user_chk";
	}

	@PostMapping("join")
	public String join(HttpSession session, MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr)
			throws ServletException, IOException {
		log.info("join이 호출되었습니다.");
		String pwd = memberVO.getPwd();
		log.info("입력하려는 비밀번호" + pwd);
		String ppwd = pwdEncoder.encode(pwd);
		log.info("암호화된 비밀번호 :" + ppwd);
		memberVO.setPwd(ppwd);
		log.info("멤버에 입력된 비밀번호 :" + memberVO.getPwd());
		service.insertMember(memberVO);
		service.insertAuth(memberVO);
		String id = memberVO.getId();
		session.setAttribute("id", id);

		return "member/step3";
	}

	@RequestMapping("id_check_form")
	public String id_check_form(HttpServletRequest req, @RequestParam String id) throws ServletException, IOException {
		log.info("id_check_form이 호출되었습니다.");
		MemberVO memberVO = service.getMember(id);
		int result = -1;
		if (memberVO == null) {
			result = -1;
		} else {
			result = 1;
		}
		req.setAttribute("id", id);
		req.setAttribute("result", result);

		return "member/idcheck";
	}

	@GetMapping("searchID_Form")
	public String searchID_Form() {
		log.info("searchID_Form이 호출되었습니다.");
		return "member/search_ID";
	}

	@GetMapping("searchPW_Form")
	public String searchPW_Form(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) {
		log.info("searchPW_Form이 호출되었습니다.");
		return "member/search_PW";
	}

	@PostMapping("search_ID")
	public String search_ID(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr,HttpSession session ) {
		log.info("search_ID가 호출되었습니다.");
		String name = memberVO.getName();
		String phone = memberVO.getPhone();
		MemberVO memberVOo = service.selectIdByName(name, phone);
		if (memberVOo != null) {
			req.setAttribute("member", memberVOo);
			String id = memberVOo.getId();
			session.setAttribute("id", id);
			return "member/your_ID";
		} else {
			req.setAttribute("message", "<hr><br>아이디를 찾을 수 없습니다 입력하신 정보를 다시 확인해주세요");

			return "member/search_ID";
		}

	}

	@PostMapping("search_PW")
	public String search_PW(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) {
		log.info("search_PW가 호출되었습니다.");
		String id = memberVO.getId();
		String name = memberVO.getName();
		String email = memberVO.getEmail();
		MemberVO memberVOo = service.selectPWById(id, name, email);
		if (memberVOo != null) {
			String npwd = pwdEncoder.encode("1234");
			service.updatePassword(id, npwd);
			return "member/your_PW";
		} else {
			req.setAttribute("message", "<hr><br>비밀번호를 찾을 수 없습니다 입력하신 정보를 다시 확인해주세요");

			return "member/search_PW";
		}

	}

	@GetMapping("update")
	public String update() {
		log.info("update이 호출되었습니다.");
		return "member/check_pass_form";
	}

	@GetMapping("check_pass")
	public String check_pass(MemberVO memberVO, HttpServletRequest req) {
		log.info("check_pass가 호출되었습니다.");
		String pwd = memberVO.getPwd();
		log.info("입력한 비번 :" + pwdEncoder.encode(pwd));
		
		MemberVO memberVOo = service.getMember(memberVO.getId());
		log.info("가져온 비번 : "+memberVOo.getPwd());
		
		if (pwdEncoder.matches( pwd,memberVOo.getPwd()) == true) {
			return "member/CheckSuccess";
		} else {
			req.setAttribute("message", "비밀번호가 일치하지  않습니다");
			return "member/check_pass_form";
		}
	}

	@GetMapping("memberUpdate")
	public String memberUpdate() {
		log.info("memberUpdate가 호출되었습니다.");
		return "member/memberUpdate";
	}

	@PostMapping("memberUpdate")
	public String memberUpdate(MemberVO memberVO, HttpSession session) {
		log.info("memberUpdate가 호출되었습니다.");
		if (memberVO.getAgree1() == null) {
			memberVO.setAgree1("0");
		}
		if (memberVO.getAgree2() == null) {
			memberVO.setAgree2("0");
		}

		String pwd = memberVO.getPwd();
		log.info("입력하려는 비밀번호" + pwd);
		String ppwd = pwdEncoder.encode(pwd);
		log.info("암호화된 비밀번호 :" + ppwd);
		memberVO.setPwd(ppwd);
		log.info("멤버에 입력된 비밀번호 :" + memberVO.getPwd());

		service.updateMember(memberVO);
		session.setAttribute("loginUser", service.getMember(memberVO.getId()));
		return "member/mypage";
	}

	@GetMapping("delete")
	public String delete() {
		log.info("delete가 호출되었습니다.");
		return "member/check_pass_form";
	}

	@RequestMapping("memberdelete")
	public String memberdelete(HttpSession session, HttpServletRequest req) {
		log.info("memberdelete이 호출되었습니다.");
		String access_Token = (String) session.getAttribute("access_Token");
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		String id = memberVO.getId();
		log.info("지우려는 아이디 값은" + id);
		log.info("지우려는 토큰 값은" + access_Token);

		if (access_Token != null) {
			System.out.println("지우려는 유저의 토큰 값 :" + access_Token);
			service.getLogout(access_Token);
			service.deleteKakaoMember(id);
		}
		service.deleteMember(id);
		session.invalidate();
		return "redirect:/main/";
	}

	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session,
			HttpServletRequest req) throws Exception {
		System.out.println("요청해온 코드" + code);
		String access_Token = service.getAccessToken(code);
		HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
		System.out.println("받아온 토큰 : " + access_Token);
		System.out.println("유저 닉네임 : " + userInfo.get("nickname"));
		System.out.println("아이디 : " + userInfo.get("id"));
		String id = (String) userInfo.get("id");
		String name = (String) userInfo.get("nickname");
		MemberVO memberVO = service.getMember(id);
		System.out.println("가져온 멤버 = " + memberVO);
		if (memberVO != null) {
			session.setAttribute("loginUser", memberVO);
			session.setAttribute("access_Token", access_Token);
			System.out.println("세션에 올린 토큰" + access_Token);
			return "member/LoginOK";
			
		} else {
			MemberVO memberVOo = new MemberVO();
			// 카카오 유저 받아올 수 있는 값=아이디/이름 뿐이라 다른 값들은 세팅해줌
			memberVOo.setName(name);
			String pwd = "1234";
			String ppwd = pwdEncoder.encode(pwd);
			memberVOo.setPwd(ppwd);
			memberVOo.setId(id);
			System.out.println(memberVOo);
			service.insertkakao(memberVOo);
			session.setAttribute("loginUser", memberVOo);
			session.setAttribute("access_Token", access_Token);
			System.out.println("세션에 올린 토큰" + access_Token);
			req.setAttribute("message",
					"<br> 회원님의 비밀번호는 <span style=\"color: #df0202\">1234</span>입니다. <br> 마이페이지에서 정보를 수정해주세요");
			
			return "member/LoginOK";
		}
	}


	@RequestMapping("LoginOK111")
	public String LoginOK(Principal principal, HttpServletRequest request, Model model, HttpSession session) {
		
		String prodno = request.getParameter("prodno");
		if (prodno != null) {
			model.addAttribute("prodno", prodno);
			log.info("이전에 보고있던 제품번호"+prodno);
		}
		
		log.info("mypage가 호출되었습니다.");
		String id = "";
		if (principal != null) {
			id = principal.getName();
			MemberVO memberVO = service.getMember(id);
			model.addAttribute("loginUser", memberVO);
			session.setAttribute("loginUser", memberVO);
		}

		return "member/LoginOK";		
	}
	
	@RequestMapping("mypage")
	public String mypage(Principal principal, HttpServletRequest request, Model model, HttpSession session) {
		log.info("mypage가 호출되었습니다.");
		String id = "";
		if (principal != null) {
			id = principal.getName();
			MemberVO memberVO = service.getMember(id);
			model.addAttribute("loginUser", memberVO);
			session.setAttribute("loginUser", memberVO);
		}

		return "member/mypage";
	}
	
	
	/* 주문내역 */
	@RequestMapping("/Mycart_list")
	public void Mycart_list(Principal principal, HttpServletRequest request, Model model) {
		log.info("mypage가 호출되었습니다.");
		
		String id ="";
		String userid = "";
		if(principal != null) {
			userid = principal.getName();
			
			id = principal.getName();
			MemberVO memberVO = service.getMember(id);
			model.addAttribute("loginUser", memberVO);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", memberVO);
		}
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser != null) {
			userid = loginUser.getId();
		}
		
		//userid의 현재 진행 중인 주문 내역의 주문번호
		ArrayList<Integer> ordernoList = orderService.ordernoList(userid);
		
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		//result가 1인 상품만 출력 (1: 처리 진행중) 최근 주문 상품
		
		OrderVO orderResult12 = new OrderVO();
		for (int orderno : ordernoList) {
			orderResult12.setOrderno(orderno);
			orderResult12.setUserid(userid);
			ArrayList<OrderVO> orderAllList = orderService.listOrderResult12(orderResult12);
			
			OrderVO orderVO;
			try {
				orderVO = orderAllList.get(0);
				if(orderAllList.size()==1) {
					orderVO.setName_kr(orderVO.getName_kr());
				}else {				
					orderVO.setName_kr(orderVO.getName_kr() + " 외 " + (orderAllList.size()-1) + "건" );
				}
			} catch (IndexOutOfBoundsException e) {
				e.printStackTrace();
				orderVO = null;
			}

			int totalPrice = 0;
			for (OrderVO ovo : orderAllList) {
				totalPrice += ovo.getPrice() * ovo.getNum();
			}
			
			//배송비 금액
			int delivery;
			if(totalPrice >= 50000) {
				delivery = 0;
			}else {
				delivery = 2500;
			}

			orderVO.setPrice(totalPrice+delivery);
			orderList.add(orderVO);
		}
		model.addAttribute("orderList",orderList);

		//userid의 진행완료된 주문 내역의 주문번호
		ArrayList<Integer> orderOKnoList = orderService.orderOKnoList(userid);
		
		ArrayList<OrderVO> orderOKList = new ArrayList<OrderVO>();
		//result가 2인 상품만 출력 (2: 처리 진행완료) 주문내역

		OrderVO listOrderById = new OrderVO();
		for (int orderno : orderOKnoList) {
			listOrderById.setUserid(userid);
			listOrderById.setResult("2");
			listOrderById.setOrderno(orderno);
			ArrayList<OrderVO> orderAllList = orderService.listOrderById(listOrderById);

			OrderVO orderOK;
			try {
				orderOK = orderAllList.get(0);
				if(orderAllList.size()==1) {
					orderOK.setName_kr(orderOK.getName_kr());
				}else {					
					orderOK.setName_kr(orderOK.getName_kr() + " 외 " + (orderAllList.size()-1) + "건" );
				}
			} catch (IndexOutOfBoundsException e) {
				orderOK = null;
			}

			
			int totalPrice = 0;
			for (OrderVO ovo : orderAllList) {
				totalPrice += ovo.getPrice() * ovo.getNum();
			}
			
			//배송비 금액
			int delivery;
			if(totalPrice >= 50000) {
				delivery = 0;
			}else {
				delivery = 2500;
			}
			
			orderOK.setPrice(totalPrice+delivery);
			orderOKList.add(orderOK);
		}
		model.addAttribute("orderOKList",orderOKList);
		
	}
	
	/* 주문상세 */
	@GetMapping("/order_detail")
	public String Mycart_orderDetail(Principal principal, @RequestParam("orderno") String orderno, HttpServletRequest request, Model model) {
		
		String userid = "";
		if(principal != null) {
			userid = principal.getName();
		}	
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser != null) {
			userid = loginUser.getId();
		}
		
		int num = Integer.parseInt(orderno);
		
		OrderVO orderVO = new OrderVO();
		orderVO.setUserid(userid);
		orderVO.setOrderno(num);
		
		model.addAttribute("orderno",num);
		ArrayList<OrderVO> orderList = orderService.listOrderResult12(orderVO);
		
		int totalPrice=0;
		for(OrderVO ovo :orderList){
			totalPrice+=ovo.getPrice()*ovo.getNum();
		}
		
		//배송비 금액
		int delivery;
		if(totalPrice >= 50000) {
			delivery = 0;
		}else {
			delivery = 2500;
		}
		
		model.addAttribute("orderList",orderList);
		model.addAttribute("totalPrice",totalPrice+delivery);
		
		return "/member/MyCart_orderDetail";
	}
	
	/* 반품내역 */
	@RequestMapping("/Mycart_cancellist")
	public void Mycart_cancellist(Principal principal, HttpServletRequest request, Model model) {
		log.info("Mycart_cancellist가 호출되었습니다.");
		
		String userid = "";
		if(principal != null) {
			userid = principal.getName();
		}	
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser != null) {
			userid = loginUser.getId();
		}
		
		//userid의 현재 진행 중인 반품 내역(result:3)의 주문번호
		ArrayList<Integer> ordernoList = orderService.ordercancelList(userid);
		
		ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();
		//result가 3인 상품만 출력 (3: 반품처리 진행중) 최근 주문 상품
		
		OrderVO orderResult34 = new OrderVO();
		for (int orderno : ordernoList) {
			orderResult34.setOrderno(orderno);
			orderResult34.setUserid(userid);
			ArrayList<OrderVO> orderAllList = orderService.listOrderResult34(orderResult34);
			
			OrderVO orderVO = orderAllList.get(0);
			if(orderAllList.size()==1) {
				orderVO.setName_kr(orderVO.getName_kr());
			}else {				
				orderVO.setName_kr(orderVO.getName_kr() + " 외 " + (orderAllList.size()-1) + "건" );
			}

			int totalPrice = 0;
			for (OrderVO ovo : orderAllList) {
				totalPrice += ovo.getPrice() * ovo.getNum();
			}
			
			//배송비 금액
			int delivery;
			if(totalPrice >= 50000) {
				delivery = 0;
			}else {
				delivery = 2500;
			}
			
			orderVO.setPrice(totalPrice+delivery);
			orderList.add(orderVO);
		}
		model.addAttribute("orderList",orderList);		


		//userid의 진행완료된 (result:4) 주문 내역의 주문번호
		ArrayList<Integer> orderOKnoList = orderService.ordercancelOKList(userid);
		
		ArrayList<OrderVO> orderOKList = new ArrayList<OrderVO>();
		//result가 4인 상품만 출력 (4: 반품처리 진행완료) 주문내역
		
		OrderVO listOrderById = new OrderVO();
		for (int orderno : orderOKnoList) {
			listOrderById.setUserid(userid);
			listOrderById.setResult("4");
			listOrderById.setOrderno(orderno);
			ArrayList<OrderVO> orderAllList = orderService.listOrderById(listOrderById);

			OrderVO orderOK;
			try {
				orderOK = orderAllList.get(0);
				if(orderAllList.size()==1) {
					orderOK.setName_kr(orderOK.getName_kr());
				}else {					
					orderOK.setName_kr(orderOK.getName_kr() + " 외 " + (orderAllList.size()-1) + "건" );
				}
			} catch (IndexOutOfBoundsException e) {
				orderOK = null;
			}

			int totalPrice = 0;
			for (OrderVO ovo : orderAllList) {
				totalPrice += ovo.getPrice() * ovo.getNum();
			}
			
			//배송비 금액
			int delivery;
			if(totalPrice >= 50000) {
				delivery = 0;
			}else {
				delivery = 2500;
			}
			
			orderOK.setPrice(totalPrice+delivery);
			orderOKList.add(orderOK);
		}
		model.addAttribute("orderOKList",orderOKList);
	}
	
	/* 반품상세 */
	@GetMapping("/cancel_detail")
	public String cancel_detail(Principal principal, @RequestParam("orderno") String orderno, HttpServletRequest request, Model model) {
		
		String userid = "";
		if(principal != null) {
			userid = principal.getName();
		}	
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		if(loginUser != null) {
			userid = loginUser.getId();
		}
		
		int num = Integer.parseInt(orderno);
		
		OrderVO orderVO = new OrderVO();
		orderVO.setUserid(userid);
		orderVO.setOrderno(num);
		
		model.addAttribute("orderno",num);
		ArrayList<OrderVO> orderList = orderService.listOrderResult34(orderVO);
		
		int totalPrice=0;
		for(OrderVO ovo :orderList){
			totalPrice+=ovo.getPrice()*ovo.getNum();
		}
		
		//배송비 금액
		int delivery;
		if(totalPrice >= 50000) {
			delivery = 0;
		}else {
			delivery = 2500;
		}
		
		model.addAttribute("orderList",orderList);
		model.addAttribute("totalPrice",totalPrice+delivery);
		
		return "/member/MyCart_cancelDetail";
	}
	
	

	

}
