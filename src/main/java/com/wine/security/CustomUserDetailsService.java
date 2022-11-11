package com.wine.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.wine.mapper.MemberMapper;
import com.wine.model.MemberVO;
import com.wine.security.model.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + userName);

		//return null;

		// userName means userid
		MemberVO vo = memberMapper.read(userName);

		log.warn("queried by member mapper: " + vo);

		//vo값이 있으면 CustomerUser타입의 객체로 변환해서 반환
		return vo == null ? null : new CustomUser(vo);
	} 

}
