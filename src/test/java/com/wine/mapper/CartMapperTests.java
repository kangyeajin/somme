package com.wine.mapper;

import java.util.List;

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

public class CartMapperTests {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	@Test
	public void testselectCartAll() {
		mapper.selectCartAll().forEach(cart -> {
			log.info(cart);
		});
	}
	
	@Test
	public void testselectCartByuserid() {
		mapper.selectCartByuserid("id02").forEach(cart -> {
			log.info(cart);
		});
	}
	
	@Test
	public void testselectPaymentByuserid() {
		mapper.selectPaymentByuserid("12345678").forEach(cart -> {
			log.info(cart);
		});
	}
	
	@Test
	public void testselectcheckList() {
		mapper.selectcheckList("11");
	}
	
	@Test
	public void testaddCart() {
		CartVO cVo = new CartVO();
		cVo.setUserid("12345678");
		cVo.setProdno(4);
		cVo.setNo(2);
		mapper.addCart(cVo);
	}
	
	@Test
	public void testdeleteCart() {
		log.info("count delete : " + mapper.deleteCart(9));
	}

	@Test
	public void testdeleteAllCart() {
		mapper.deleteAllCart("12345678");
	}
	
	@Test
	public void testmodifyCount() {
		CartVO cVo = new CartVO();
		cVo.setNo(5);
		cVo.setCartno(10);
		mapper.modifyCount(cVo);
	}
	
	@Test
	public void testmodifyCountANDResult() {
		mapper.modifyCountANDResult(10);
	}
	
	@Test
	public void testselectAddrByuserid() {
		List<CartVO> list = mapper.selectAddrByuserid("12345678");
		log.info(list.get(0));
	}
	
//	@Test
//	public void testmultiDelete() {
//		String[] cartno = {"1","2"};
//		for(int i=0 ; i<cartno.length ; i++) {
//			mapper.multiDelete(cartno[i]);
//		}
//	}
	
	@Test //???????????????????????
	public void testcheckCart() {
		CartVO cVo = new CartVO();
		cVo.setUserid("12345678");
		cVo.setProdno(3);
		mapper.checkCart(cVo);
		log.info("---------------"+cVo);
	}
	
	@Test
	public void testupdateCart() {
		CartVO cVo = new CartVO();
		cVo.setNo(2);
		cVo.setNewNo(2);
		cVo.setCartno(3);
		mapper.updateCart(cVo);
		log.info("---------------"+cVo);
	}
	
	@Test
	public void testsumPrice() {
		CartVO cVo = mapper.sumPrice("12345678");
		log.info("---------------"+cVo);
	}
	
	@Test
	public void testdeleteCartbyuserid() {
		mapper.deleteCartbyuserid("12345678");
	}
	
}
