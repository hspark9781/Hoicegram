package com.hsp.hoicegram.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class PermissionInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		String uri = request.getRequestURI();
		
		if(userId != null) {
			// 로그인이 되었을때
			// 회원가입, 로그인 페이지 접근하려고 하면
			// /user로 시작하는 페이지에 접근하려고 하면
			// 리스트 페이지로 이동 시켜라
			if(uri.startsWith("/user")) {
				// 리다이렉트
				response.sendRedirect("/post/timeline/view");
				return false;
			}
		} else {
			// 로그인이 안됐을 때
			// 리스트 글쓰기 상세화면 페이지로 접근하려고 하면
			// /post로 시작하는 페이지에 접근하려고 하면
			// 로그인 페이지로 이동해라
			if(uri.startsWith("/post")) {
				//리다이렉트
				response.sendRedirect("/user/signin/view");
				return false;
			}
			
		}
		
		return true;
		
		
	}

}
