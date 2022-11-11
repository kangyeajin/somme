package com.wine.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wine.model.CartVO;
import com.wine.model.Criteria;
import com.wine.model.MemberVO;
import com.wine.model.PageDTO;
import com.wine.service.CartService;
import com.wine.service.ProductService;
import com.wine.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product/*")
@Log4j

@AllArgsConstructor
public class ProductController {
	
	private ProductService service;
	private CartService cartservice;
	private final ReviewService rService;
	
	//상세페이지
	@GetMapping("detail")
	public String detail(Principal principal, Criteria cri, @RequestParam("prodno") String prodno, Model model,
						 HttpServletRequest request) {
		
		model.addAttribute("product",service.selectProductByCode(prodno));
		
		int checkCart = 0;
		int checkPayment = 0;
		String userid = "";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if(principal != null) {
			userid = principal.getName();
			
			CartVO cart = new CartVO();
			cart.setUserid(userid);
			cart.setProdno(Integer.parseInt(prodno));
			
			if(cartservice.checkCart(cart) != null) {
				checkCart = 1;//상품이 이미 담겨있는 경우result=1;
			} else {
				checkCart = 0;
			}
			
			if(cartservice.checkPayment(cart) != null) {
				checkPayment = 1;//이미 주문한 상품인 경우result=1;
			} else {
				checkPayment = 0;
			}
			
		} else if(loginUser != null) {
			userid = loginUser.getId();
			
			CartVO cart = new CartVO();
			cart.setUserid(userid);
			cart.setProdno(Integer.parseInt(prodno));
			
			if(cartservice.checkCart(cart) != null) {
				checkCart = 1;//상품이 이미 담겨있는 경우result=1;
			} else {
				checkCart = 0;
			}
			
			if(cartservice.checkPayment(cart) != null) {
				checkPayment = 1;//이미 주문한 상품인 경우result=1;
			} else {
				checkPayment = 0;
			}
			
		}else {
			checkCart = 3; //로그인 하지 않은 경우
			checkPayment = 3; //주문하지 않은 경우
		}
		
		request.setAttribute("checkCart", checkCart);
		request.setAttribute("checkPayment", checkPayment);
		
		model.addAttribute("reviewList",rService.getList(cri));
		int total = rService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total,5.0,5,4));
		
		return "review/detail";
	}
	
	@GetMapping("product_list")
	public void product_list(){}

	/*종류별-------------------------------------------*/
	@GetMapping("wine_list")
	public String wine_list(HttpServletRequest httpServletRequest, Model model){		
		String kind = httpServletRequest.getParameter("kind");
		if(kind == null || kind =="") {
			model.addAttribute("productList", service.selectAllProducts());
			return "/product/wine_list";
		} else if(kind.equals("all")) {
			log.info("--------- kind가 all인 경우");
			model.addAttribute("productList", service.selectAllProducts());
			return "/product/product_list";
		} else {
			log.info("--------- kind : "+kind);
			model.addAttribute("productList", service.listKindProduct(kind));
			return "/product/product_list";
		}
	}
	
	/*국가별-------------------------------------------*/
	@GetMapping("wine_contry")
	public String wine_contry(HttpServletRequest httpServletRequest, Model model){		
		String kind = httpServletRequest.getParameter("kind");
		if(kind == null || kind =="") {
			model.addAttribute("productList", service.selectAllProducts());
			return "/product/wine_contry";
		} else if(kind.equals("all")) {
			log.info("--------- kind가 all인 경우");
			model.addAttribute("productList", service.selectAllProducts());
			return "/product/product_list";
		} else {
			log.info("--------- kind : "+kind);
			model.addAttribute("productList", service.listKind_conProduct(kind));
			return "/product/product_list";
		}
	}
	
	@PostMapping("productSearch")
	public String listProductSearch(HttpServletRequest request, Model model) {
		String search =request.getParameter("search");
		
		model.addAttribute("productListS", service.listProductSearch(search));
		return "/product/productSearch";
		
	}


}
