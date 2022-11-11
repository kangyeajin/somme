package com.wine.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		// 로그인 성공 시 이전에 에러 세션(로그인 실패 기록)이 존재한다면 제거
		clearSession(req);

		//실행중에 뿌려줌
		log.warn("Login Success=============");

		//권한에 따라 열리는 기본 페이지 지정
		List<String> roleNames = new ArrayList<>();

		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});

		log.warn("ROLE NAMES: " + roleNames);

		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin/product/productList");
			return;
		}
		
		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/member/LoginOK111?prodno=" + req.getParameter("prodno"));
			return;
		}

		String uri = "/";
		redirectStrategy.sendRedirect(req, response, uri);
	}
	
	// 로그인 실패 후 성공 시 남아있는 에러 세션 제거
	protected void clearSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
		}
	}

}


