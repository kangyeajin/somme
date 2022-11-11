package com.wine.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wine.model.Criteria;
import com.wine.model.MemberVO;
import com.wine.model.prodCriteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	 @Autowired
	 private MemberMapper mapper;
	 @Test
	 public void testInsert() {
		 MemberVO memberVO = new MemberVO();
		 
		 memberVO.setId("1111");
		 memberVO.setPwd("1111");
		 memberVO.setName("user1");
		 memberVO.setEmail("1@naver.com");
		 memberVO.setZipNum("1111");
		 memberVO.setAddr1("1번가");
		 memberVO.setAddr2("1동");
		 memberVO.setPhone("01011111111");
		 memberVO.setBdate("2022-10-11");
		 memberVO.setAgree1("1");
		 memberVO.setAgree2("2");
		 
		 mapper.insertMember(memberVO);
	 }
	 @Test
	 public void getMemberTest() {
		 String id = "2222";
		 MemberVO memberVO = mapper.getMember(id);
		 log.info("가져온 값------------------"+memberVO);
	 }
	 
	 @Test
	 public void testSearch() {
		 prodCriteria cri = new prodCriteria();
		 cri.setKeyword("id");
		 cri.setType("I");
		 
		 List<MemberVO> list = mapper.adminMemberPage(cri);
		 
		 list.forEach(member -> log.info(member));
	 }
	 
		@Test
		public void testRead() {
			MemberVO vo = mapper.read("admin90");
			log.info(vo);
			vo.getAuthList().forEach(authVO->{
				log.info(authVO);
			});
		}
}
