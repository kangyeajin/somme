package com.wine.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wine.model.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests {
	@Autowired
    private MemberService service;
	
	@Test
	public void testInsertService() {
		 MemberVO memberVO = new MemberVO();
		 
		 memberVO.setId("2222");
		 memberVO.setPwd("2222");
		 memberVO.setName("user2");
		 memberVO.setEmail("2@naver.com");
		 memberVO.setZipNum("2222");
		 memberVO.setAddr1("2번가");
		 memberVO.setAddr2("2동");
		 memberVO.setPhone("01022222222");
		 memberVO.setBdate("2022-10-11");
		 memberVO.setAgree1("0");
		 memberVO.setAgree2("1");
		 
		 service.insertMember(memberVO);
	 }
	 @Test
	 public void getMemberTest() {
		 String id = "2222";
		 MemberVO memberVO = service.getMember(id);
		 log.info("가져온 값-------------그리고 서비스임-----"+memberVO);
	 }
}
