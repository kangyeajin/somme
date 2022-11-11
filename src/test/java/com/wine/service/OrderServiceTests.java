package com.wine.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wine.model.CartVO;
import com.wine.model.OrderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderServiceTests {

	@Setter(onMethod_ = @Autowired)
	private OrderService service;

	@Test
	public void testExist() {
		log.info("service***------------------------------");
		log.info(service);//service객체를 잘 주입 받는지 확인 (impl과 mapper가 잘 연결 되었는지)
		//org.zerock.service.BoardServiceImpl@3f270e0a

		assertNotNull(service);// service변수가 null이 아닌 경우
	}

	@Test
	public void testMaxOrderNo() {
		Integer MaxOrderNo = service.MaxOrderNo();
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
		service.insertPayment("id02");
	}

	@Test
	public void testinsertOrderDetail() {
		CartVO cVo = new CartVO();
		cVo.setMaxOrderNo(2);
		cVo.setUserid("id02");
		cVo.setResult("1");
		cVo.setProdno(2);
		cVo.setNo(5);

		service.insertOrderDetail(cVo);
	}
	
	 @Test
	 public void testcartResult2() {
		 service.cartResult2(44);
	 }
	 
	 @Test
	 public void testordernoList() {
		 service.ordernoList("id02");
	 }
	 
	 @Test
	 public void testlistOrderResult12() {
		 OrderVO cVo = new OrderVO();
		 cVo.setUserid("id02");
		 cVo.setOrderno(4);
		 service.listOrderResult12(cVo);
	 }
	 
	 @Test
	 public void testorderOKnoList() {
		 service.orderOKnoList("id02");
	 }
	 
	 @Test
	 public void testordercancelList() {
		 service.ordercancelList("id02");
	 }
	 
	 @Test
	 public void testordercancelOKList() {
		 service.ordercancelOKList("id01");
	 }

}
