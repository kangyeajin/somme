package com.wine.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wine.model.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {

	@Setter(onMethod_ = @Autowired)
	private ProductService service;

	
	@Test
	public void testselectProductByCode() {
		ProductVO pVo = service.selectProductByCode("1");
		log.info(pVo);
	}
	
	@Test
	public void testselectMainProducts() {
		service.selectMainProducts().forEach(MainProduct -> {
			log.info(MainProduct);
		});
	}
	
	@Test
	public void testinsertProduct() {
		ProductVO pVo = new ProductVO();
		pVo.setName_kr("ㅇㅇ");
		pVo.setName_en("rr");
		pVo.setKind_con("italia");
		pVo.setKind("white");
		pVo.setPrice(10);
		pVo.setContent_1("dd");
		pVo.setContent_2("dd");
		pVo.setImage("dd");
		pVo.setMainprod("O");
		
		service.insertProduct(pVo);
	}
}
