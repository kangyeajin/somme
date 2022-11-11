package com.wine.mapper;

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

public class ProductMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Test
	public void testselectMainProducts() {
		mapper.selectMainProducts().forEach(MainProduct -> {
			log.info(MainProduct);
		});
	}
	
	@Test
	public void testselectProductByCode() {
		ProductVO pVo = mapper.selectProductByCode("1");
		log.info(pVo);
	}
	
	
	@Test
	public void testlistProductSearch() {
		mapper.listProductSearch("뤠암").forEach(list -> {
			log.info(list);
		});
	}
	
	@Test
	public void testinsertProduct() {
		ProductVO pVo = new ProductVO();
		pVo.setName_kr("이름");
		pVo.setName_en("name");
		pVo.setKind("red");
		pVo.setKind_con("USA");
		pVo.setPrice(15000);
		pVo.setContent_1("123456");
		pVo.setContent_2("123456.png");
		pVo.setImage("123.png");
		pVo.setMainprod("O");
		
		mapper.insertProduct(pVo);
		log.info(pVo);
	}
	
	@Test
	public void testdeleteProduct() {
		mapper.deleteProduct("21");
	}
	
	@Test
	public void testupdateProduct() {
		ProductVO pVo = mapper.selectProductByCode("11");
		pVo.setName_kr("이름2");
		pVo.setName_en("name2");
		mapper.updateProduct(pVo);
	}
	
	@Test
	public void testmultiDelete() {
		String[] prodno = {"11", "12"};
		log.info(prodno[0]);
		for(int i=0 ; i<prodno.length ; i++) {
			mapper.multiDelete(prodno[i]);			
		}
	}
	
}
