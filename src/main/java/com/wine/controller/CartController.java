package com.wine.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wine.model.CartVO;
import com.wine.model.MemberVO;
import com.wine.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart/*")
@Log4j

@AllArgsConstructor
public class CartController {
   @Autowired
   private CartService service;
   
   @GetMapping("")
   public String cart(Principal principal, HttpServletRequest request, Model model) {
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }   
      
      HttpSession session = request.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = loginUser.getId();
      }

      model.addAttribute("CartList", service.cartList(userid));
      model.addAttribute("userid",userid);

      CartVO cVo = service.sumPrice(userid);
      model.addAttribute("cVo", cVo);
      
      return "/cart/cart";
   }

   //장바구니 버튼
   @RequestMapping("/cart_insert")
   public String cart_insert (Principal principal, HttpServletRequest httpServletRequest, Model model) {
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }   
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = httpServletRequest.getParameter("userid");
      }

      String prodno = httpServletRequest.getParameter("prodno");//제품 번호
      String quantity = httpServletRequest.getParameter("quantity");//새로 받아온 수량
      
      int no = Integer.parseInt(quantity);
      int newNo;

      CartVO check = new CartVO();
      check.setUserid(userid);
      check.setProdno(Integer.parseInt(prodno));

      CartVO cart = service.checkCart(check);//기존 값(수량)을 가져옴
      
      if(cart != null) {//장바구니에 이미 담긴 제품인 경우
         int Num = cart.getNo();
         newNo = no + Num;
         int cartno = cart.getCartno();
         //log.info("-----------수량합계 : "+newNo);
         //log.info("-----------장바구니 번호 : "+cartno);

         CartVO cVo = new CartVO();
         cVo.setNewNo(newNo);
         cVo.setCartno(cartno);

         service.updateCart(cVo);

      }else {//장바구니에 담기지 않은 제품인 경우
         //log.info("-----------장바구니에 담기------------");
         CartVO cVo = new CartVO();
         cVo.setUserid(userid);
         cVo.setProdno(Integer.parseInt(prodno));
         cVo.setNo(Integer.parseInt(quantity));

         service.addCart(cVo);
      }
      
      return "redirect:/product/detail?prodno="+prodno;
   }
   
   //주문하기 버튼
   @RequestMapping("cart_insert_buy")
   public String cart_insert_buy(Principal principal, HttpServletRequest httpServletRequest, Model model){

      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = httpServletRequest.getParameter("userid");
      }

      String prodno = httpServletRequest.getParameter("prodno");
      String quantity = httpServletRequest.getParameter("quantity");
      
      //log.info("=================>>>"+userid+"의 주문상품은 " + prodno+"번, 수량은"+ quantity+"개"+"<<<===========");
      
      int no = Integer.parseInt(quantity);
      int newNo;

      CartVO check = new CartVO();
      check.setUserid(userid);
      check.setProdno(Integer.parseInt(prodno));

      CartVO cart = service.checkCart(check);

      if(cart != null) {//장바구니에 이미 담긴 제품인 경우
         int Num = cart.getNo();
         newNo = no + Num;
         int cartno = cart.getCartno();
         //log.info("-----------수량합계 : "+newNo);
         //log.info("-----------장바구니 번호 : "+cartno);

         CartVO cVo = new CartVO();
         cVo.setNewNo(newNo);
         cVo.setCartno(cartno);

         service.updateCart(cVo);

      }else {//장바구니에 담기지 않은 제품인 경우
         //log.info("-----------장바구니에 담기------------");
         CartVO cVo = new CartVO();
         cVo.setUserid(userid);
         cVo.setProdno(Integer.parseInt(prodno));
         cVo.setNo(Integer.parseInt(quantity));

         service.addCart(cVo);
      }

      return "redirect:/cart/cart?userid="+userid;
   }

   @GetMapping("/delete")
   public String cartdelete(Principal principal, HttpServletRequest httpServletRequest, Model model) {
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }
      
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = loginUser.getId();
      }
      
      String cartno = httpServletRequest.getParameter("cartno");
      service.deleteCart(Integer.parseInt(cartno));

      return "redirect:/cart/cart?userid="+userid;
   }

   @GetMapping("/deleteAll")
   public String cartdeleteAll(Principal principal, HttpServletRequest httpServletRequest, Model model) {
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }
      
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = loginUser.getId();
      }
      service.deleteAllCart(userid);

      return "redirect:/cart/cart?userid="+userid;
   }

   @PostMapping("/multidelete")
   public String multiDelete(Principal principal, HttpServletRequest httpServletRequest, Model model) {
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }
      
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = loginUser.getId();
      }
      String[] cartno = httpServletRequest.getParameterValues("buy");
      for(int i =0; i<cartno.length; i++) {
         log.info("cartno:"+cartno[i]);
         service.deleteCart(Integer.parseInt(cartno[i]));
      }
      return "redirect:/cart/cart?userid="+userid;
   }

   @PostMapping("/payment")
   public void payment(Principal principal, HttpServletRequest httpServletRequest, Model model) {
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }
      
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = loginUser.getId();
      }

      //장바구니 수량의 배열 받아오기
      String [] quantity = httpServletRequest.getParameterValues("quantity");
//      for(int i =0; i<quantity.length; i++) {
//         log.info("quantity:"+quantity[i]);
//      }

      //장바구니에 있는 전체 값 받아오기
      String [] cartAllno = httpServletRequest.getParameterValues("cartno");

      CartVO cVo = new CartVO();

      //장바구니 수량 수정
      for(int i=0; i<cartAllno.length ; i++) {
         cVo.setNo(Integer.parseInt(quantity[i]));
         cVo.setCartno(Integer.parseInt(cartAllno[i]));
         boolean result = service.modifyCount(cVo);
         if(result) {
            log.info("장바구니 수량 수정 성공");
         }else {
            log.info("장바구니 수량 수정 실패");
         }
      }

      //체크한 장바구니 번호 받아오기
      String[] cartno = httpServletRequest.getParameterValues("buy");
      
      //체크 된 카트 번호에 맞는 제품정보 가져오기 
      List<CartVO> prodlist = new ArrayList<CartVO>(); 
      for (int i=0 ; i< cartno.length ; i++) { //2번 반복
         CartVO cartcheck;
         cartcheck = service.selectcheckList(cartno[i]);
         prodlist.add(cartcheck);
      }
      model.addAttribute("ProdList", prodlist);
      
      //주문명
      int size = prodlist.size();
      String name = prodlist.get(0).getName_kr();
      
      CartVO cvo = prodlist.get(0);
      if(prodlist.size()==1) {
         cvo.setProdname(name);
      }else {               
         cvo.setProdname(name + " 외 " + (size-1) + "건");
      }
      model.addAttribute("prodname", cvo.getProdname());
      
      //회원 아이디로 배송정보 얻어오기
      List<CartVO> addrList = service.AddrList(userid);
      model.addAttribute("AddrList", addrList.get(0));

      //총 합계 금액
      int totalPrice=0;
      for(CartVO cartVo :prodlist){
         totalPrice+=cartVo.getPrice()*cartVo.getNo();
      }
      model.addAttribute("totalPrice", totalPrice);
      
      //배송비 금액
      int delivery;
      if(totalPrice >= 50000) {
         delivery = 0;
      }else {
         delivery = 2500;
      }
      model.addAttribute("delivery", delivery);
   }
}