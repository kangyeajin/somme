package com.wine.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wine.model.CartVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartServiceTests {

	@Setter(onMethod_ = @Autowired)
	private CartService service;

	@Test
	public void testExist() {
		log.info("service***------------------------------");
		log.info(service);//service객체를 잘 주입 받는지 확인 (impl과 mapper가 잘 연결 되었는지)
		//org.zerock.service.BoardServiceImpl@3f270e0a

		assertNotNull(service);// service변수가 null이 아닌 경우
	}

	@Test 
	public void testaddCart() {
		CartVO cVo = new CartVO();
		cVo.setUserid("id02");
		cVo.setProdno(2);
		cVo.setNo(2);

		service.addCart(cVo);
	}

	@Test 
	public void testcheckCart() {
		CartVO cVo = new CartVO();
		cVo.setUserid("id02");
		cVo.setProdno(2);

		service.checkCart(cVo);

		if(service.checkCart(cVo) != null) {
			log.info(".....값이 있음");
		} else {
			log.info(".....값이 없음");
		}
	}

	@Test 
	public void testupdateCart() {
		CartVO cVo = new CartVO();
		cVo.setNewNo(10);
		cVo.setCartno(27);
		service.updateCart(cVo);
	}

	@Test 
	public void testcartList() {
		service.cartList("id02").forEach(list -> {
			log.info(list);
		});
	}

	@Test
	public void testdeleteCart() {
//		service.deleteCart(31);
		
//		String[] cartno = {"39","34"};
//		for(int i=0 ; i<cartno.length ; i++) {
//			service.deleteCart(cartno[i]);
//		}
	}

	@Test
	public void testdeleteAllCart() {
		service.deleteAllCart("12345678");
	}
	
	@Test 
	public void testmodifyCount() {
		CartVO cVo = new CartVO();
		cVo.setNo(5);
		cVo.setCartno(46);
		service.modifyCount(cVo);
	}
	
	@Test 
	public void testmodifyResult() {
		service.modifyResult(46);
	}
	
//	@Test
//	public void testcheckList() {
//		service.checkList("id02");
//	}
	
	@Test
	public void testAddrList() {
		service.AddrList("id02");
	}
	
	@Test
	public void testPaymentList() {
		service.PaymentList("id02");
	}

	@Test
	public void testdeleteCartbyuserid() {
		service.deleteCartbyuserid("id02");
	}
}
