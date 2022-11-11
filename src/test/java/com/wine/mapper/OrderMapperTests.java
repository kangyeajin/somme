package com.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wine.model.CartVO;
import com.wine.model.OrderVO;
import com.wine.model.prodCriteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class OrderMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;
	
	 @Test
	 public void testMaxOrderNo() {
		 Integer MaxOrderNo = mapper.MaxOrderNo();
		 if(MaxOrderNo == null) {
			 MaxOrderNo = 1;
			 log.info("주문 값이 null인 경우 주문 번호 : "+ MaxOrderNo);
		 }else {
			 MaxOrderNo +=1;
			 log.info("주문 값이 있는 경우 주문 번호 :"+ MaxOrderNo);			 
		 }
	 }
	 
	 @Test
	 public void testinsertPayment() {
		 mapper.insertPayment("id02");
	 }
	 
	 @Test
	 public void testinsertOrderDetail() {
		 CartVO cVo = new CartVO();
		 cVo.setMaxOrderNo(2);
		 cVo.setUserid("id01");
		 cVo.setResult("1");
		 cVo.setProdno(2);
		 cVo.setNo(3);
		 
		 mapper.insertOrderDetail(cVo);
	 }
	
	 @Test
	 public void testcartResult2() {
		 mapper.cartResult2(46);
	 }
	 
	 @Test
	 public void testordernoList() {
		 mapper.ordernoList("id02");
	 }
	 
	 @Test
	 public void testlistOrderResult12() {
		 OrderVO cVo = new OrderVO();
		 cVo.setUserid("id02");
		 cVo.setOrderno(4);
		 mapper.listOrderResult12(cVo);
	 }
	 
	 @Test
	 public void testorderOKList() {
		 mapper.orderOKnoList("id02");
	 }
	 
	 @Test
	 public void testlistOrderById() {
		 OrderVO cVo = new OrderVO();
		 cVo.setUserid("id02");
		 cVo.setOrderno(4);
		 cVo.setResult("1");
		 mapper.listOrderById(cVo);
	 }
	 
	 @Test
	 public void testlistOrder() {
		 prodCriteria cri = new prodCriteria();
		 cri.setPageNum(2);
//		 cri.setAmount(10);
//		 cri.setName("이");
		 mapper.listOrder(cri);
	 }
	 
	 @Test
	 public void testupdateOrderResult() {
		 mapper.updateOrderResult("6");
	 }
	 
	 @Test
	 public void testorderdelete() {
		 OrderVO ordervo = new OrderVO();
		 ordervo.setUserid("id01");
		 ordervo.setOrderno(5);
		 mapper.orderdelete(ordervo);
	 }
	 
	 @Test
	 public void testupdateCancelResult() {
		 mapper.updateCancelResult(9);
	 }
	 
	 @Test
	 public void testupdateCancelOKResult() {
		 mapper.updateCancelOKResult("15");
	 }
	 
	 @Test
	 public void testcancellistOrder() {
		 prodCriteria cri = new prodCriteria();
		 cri.setAmount(10);
		 cri.setName("이");
		 mapper.cancellistOrder(cri);
	 }
	 
	 @Test
	 public void testGetTotal() {
		 prodCriteria cri = new prodCriteria();
		 mapper.getTotalCount(cri);
	 }
}
