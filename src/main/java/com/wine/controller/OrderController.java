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
import org.springframework.web.bind.annotation.RequestParam;

import com.wine.model.CartVO;
import com.wine.model.MemberVO;
import com.wine.model.OrderVO;
import com.wine.service.CartService;
import com.wine.service.OrderService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order/*")
@Log4j
public class OrderController {
   
   @Setter(onMethod_ = @Autowired)
   private OrderService service;

   @Setter(onMethod_ = @Autowired)
   private CartService cartService;

   @GetMapping("/order/visit_form")
   public void visit_form() {}

   @GetMapping("/check_form")
   public void check_form() {}

   //무통장 입금/방문 결제
   @PostMapping("/pay_done")
   public void pay_done(Principal principal, HttpServletRequest httpServletRequest, Model model, OrderVO ordervo) {      
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }
      
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = loginUser.getId();
      }
      
      log.info("=================>>>"+userid);
      
      //체크 된 카트 번호의 cartno 배열 얻어오기
      String [] cartno = httpServletRequest.getParameterValues("cartno");

      //체크 된 카트 번호에 맞는 list얻어옴
      List<CartVO> usercartlist = new ArrayList<CartVO>(); 
      for (int i=0 ; i< cartno.length ; i++) {
         CartVO cartcheck;
         cartcheck = cartService.selectcheckList(cartno[i]);
         usercartlist.add(cartcheck);
      }

      //주문번호 받기
      Integer MaxOrderNo = service.MaxOrderNo();
      if(MaxOrderNo == null) {
         MaxOrderNo = 1;
         log.info("주문 값이 null인 경우 주문 번호 : "+ MaxOrderNo);
      }else {
         MaxOrderNo += 1;
         log.info("주문 값이 있는 경우 주문 번호 :"+ MaxOrderNo);          
      }

      //payment테이블에 주문 추가
      service.insertPayment(userid);

      String directMSG = httpServletRequest.getParameter("whatever");
      String message = ordervo.getMessage();
      
      //order_detail테이블에 주문 상세 추가
      for (CartVO cVo : usercartlist) {
         cVo.setMaxOrderNo(MaxOrderNo);
         cVo.setUserid(userid);
         cVo.setResult("1");
         
         if(directMSG == "") {
            cVo.setMessage(message);
         }else {
            cVo.setMessage(directMSG);
         }
         
         cVo.setZipNum(ordervo.getZipNum());
         cVo.setAddr1(ordervo.getAddr1());
         cVo.setAddr2(ordervo.getAddr2());
         cVo.setPhone(ordervo.getTel());
         log.info("==================="+cVo);
         
         service.insertOrderDetail(cVo);//order_detail테이블에 주문 상세 추가
         service.cartResult2(cVo.getCartno());//cart에 주문 진행된 값 체크(result를 2로)
      }

      model.addAttribute("MaxOrderNo",MaxOrderNo);

      //주문 상세 테이블에서 회원의 주문 내역을 가지고와 화면에 뿌림 (cart에서 userid가 동일하고 result가 2인 값의 제품목록)
      List<CartVO> paymentlist = cartService.PaymentList(userid);
      model.addAttribute("paymentlist", paymentlist);

      //총 합계 금액
      int totalPrice = ordervo.getTotalPrice();
      model.addAttribute("totalPrice", totalPrice);

      //총 수량 갯수
      int totalnum=0;
      for(CartVO cartVo :paymentlist){
         totalnum+=cartVo.getNo();
      }
      model.addAttribute("totalnum", totalnum);

      //장바구니를 비워줌 (cart에서 userid가 동일하고 result가 2인 값의 제품목록)
      cartService.deleteCartbyuserid(userid);
   }
   
   @PostMapping("/pay")
   public String pay_value(Principal principal, HttpServletRequest httpServletRequest, Model model, OrderVO ordervo) {

      String [] cartno = httpServletRequest.getParameterValues("cartno");
      model.addAttribute("cartno",cartno);
      
      String directMSG = httpServletRequest.getParameter("whatever");
      model.addAttribute("directMSG",directMSG);
      
      String message = ordervo.getMessage();
      model.addAttribute("message",message);
      String zipnum = ordervo.getZipNum();
      model.addAttribute("zipNum",zipnum);
      String addr1 = ordervo.getAddr1();
      model.addAttribute("addr1",addr1);
      String addr2 = ordervo.getAddr2();
      model.addAttribute("addr2",addr2);
      String phone = ordervo.getTel();
      model.addAttribute("phone",phone);
      
      //총 합계 금액
      int totalPrice = ordervo.getTotalPrice();
      model.addAttribute("totalPrice",totalPrice);

      return "redirect:/order/pay"; //controller단으로 넘김
      //"order/pay" jsp로 넘김
   }
   
   //카드 결제
   @GetMapping("/pay")
   public String cardpay(Principal principal, @RequestParam("totalPrice") int totalPrice, @RequestParam("message") String message, @RequestParam("directMSG") String directMSG, HttpServletRequest httpServletRequest, Model model) {

      String zipnum = httpServletRequest.getParameter("zipNum");
      String addr1 = httpServletRequest.getParameter("addr1");
      String addr2 = httpServletRequest.getParameter("addr2");
      String phone = httpServletRequest.getParameter("phone");
      
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }
      
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = loginUser.getId();
      }
      //return "redirect:/order/pay_card?userid="+userid;
      
      //체크 된 카트 번호의 cartno 배열 얻어오기
      String [] cartno = httpServletRequest.getParameterValues("cartno");

      //체크 된 카트 번호에 맞는 list얻어옴
      List<CartVO> usercartlist = new ArrayList<CartVO>(); 
      for (int i=0 ; i< cartno.length ; i++) {
         CartVO cartcheck;
         cartcheck = cartService.selectcheckList(cartno[i]);
         usercartlist.add(cartcheck);
      }

      //주문번호 받기
      Integer MaxOrderNo = service.MaxOrderNo();
      if(MaxOrderNo == null) {
         MaxOrderNo = 1;
         log.info("주문 값이 null인 경우 주문 번호 : "+ MaxOrderNo);
      }else {
         MaxOrderNo += 1;
         log.info("주문 값이 있는 경우 주문 번호 :"+ MaxOrderNo);          
      }

      //payment테이블에 주문 추가
      service.insertPayment(userid);

      //order_detail테이블에 주문 상세 추가
      for (CartVO cVo : usercartlist) {
         cVo.setMaxOrderNo(MaxOrderNo);
         cVo.setUserid(userid);
         cVo.setResult("2");
         
         if(directMSG == "") {
            cVo.setMessage(message);
         }else {
            cVo.setMessage(directMSG);
         }
         
         cVo.setZipNum(zipnum);
         cVo.setAddr1(addr1);
         cVo.setAddr2(addr2);
         cVo.setPhone(phone);
         
         service.insertOrderDetail(cVo);//order_detail테이블에 주문 상세 추가
         service.cartResult2(cVo.getCartno());//cart에 주문 진행된 값 체크(result를 2로)
         log.info("주문상세 ok");
      }
      model.addAttribute("MaxOrderNo",MaxOrderNo);

      //주문 상세 테이블에서 회원의 주문 내역을 가지고와 화면에 뿌림 (cart에서 userid가 동일하고 result가 2인 값의 제품목록)
      List<CartVO> paymentlist = cartService.PaymentList(userid);
      model.addAttribute("paymentlist", paymentlist);

      //총 합계
      model.addAttribute("totalPrice", totalPrice);

      //총 수량 갯수
      int totalnum=0;
      for(CartVO cartVo :paymentlist){
         totalnum+=cartVo.getNo();
      }
      model.addAttribute("totalnum", totalnum);

      //장바구니를 비워줌 (cart에서 userid가 동일하고 result가 2인 값의 제품목록)
      cartService.deleteCartbyuserid(userid);

      return "order/pay_done";
   }
   
   @GetMapping("/delete")
   public String delete (Principal principal, @RequestParam("orderno") String orderno, HttpServletRequest httpServletRequest, Model model) {
      
      String userid = "";
      if(principal != null) {
         userid = principal.getName();
      }
         
      HttpSession session = httpServletRequest.getSession();
      MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
      if(loginUser != null) {
         userid = loginUser.getId();
      }
      
      OrderVO ordervo = new OrderVO();
      ordervo.setOrderno(Integer.parseInt(orderno));
      ordervo.setUserid(userid);
      
      service.orderdelete(ordervo);
      return "redirect:/member/Mycart_list";
   }
   
   @GetMapping("/cancel")
   public String cancel (@RequestParam("orderno") String orderno, HttpServletRequest httpServletRequest, Model model) {
      service.updateCancelResult(Integer.parseInt(orderno));
      return "redirect:/member/Mycart_list";
   }
}